#define SAMPLES 32.

varying mediump vec2 var_texcoord0;

uniform lowp vec4 enable_effects1;
uniform lowp vec4 enable_effects2;

uniform lowp vec4 effects1;
uniform lowp vec4 effects2;
uniform lowp vec4 effects3;

uniform lowp sampler2D tex0;
uniform lowp vec4 tint;

#define BLOOM enable_effects1.x
#define CHROMATIC enable_effects1.y
#define VIGNETTE enable_effects1.z
#define NOISE enable_effects1.w

#define VHS enable_effects2.x
#define SCANLINES enable_effects2.y
#define CRT enable_effects2.z
#define TIME enable_effects2.w

#define CHROMATIC_STRENGTH effects1.w

#define VIG_STRENGTH effects2.x
#define VIG_INTENSITY effects2.y
#define NOISE_STRENGTH effects2.z
#define DIST_STRENGTH effects2.w

#define SCAN_STRENGTH effects3.x
#define CRT_CURVE effects3.y

lowp vec2 vignette = vec2(0.5, 0.5);
lowp vec2 curve = vec2(2.);

float noise(vec2 uv)
{
	return fract(sin(uv.x*12.9898+uv.y*78.233)*437.585453*TIME);
}

vec4 vhs(vec2 uv)
{
	vec2 tcoord = uv;
	tcoord.x += sin(TIME*noise(uv));
	return texture2D(tex0 , tcoord)*DIST_STRENGTH;
}

float vig(vec2 uv)
{
	uv *= 1.0 - uv;
	return ( pow(uv.x*uv.y*VIG_INTENSITY*10., VIG_STRENGTH) );
}

vec3 chromatic(vec2 uv, float offset)
{
	float _r = texture2D( tex0, vec2(uv.x+offset, uv.y)).r;
	float _g = texture2D( tex0, uv).g;
	float _b = texture2D( tex0, vec2(uv.x-offset, uv.y)).b;
	return vec3(_r,_g,_b);
}

vec2 crt_curve( vec2 uv )
{
	uv = uv * 2.0 - 1.0;
	vec2 uvoff = abs(uv.xy) / vec2(CRT_CURVE, CRT_CURVE);
	uv = uv + uv * uvoff * uvoff;
	uv = uv * .5 + .5;
	return uv;
}

void main()
{
	vec2 uv = var_texcoord0;
	if (CRT > 0.5) uv = crt_curve(var_texcoord0.xy);

	vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	vec4 color = texture2D(tex0, uv) * tint_pm;

	if (CHROMATIC > 0.5) color.rgb = tint.rgb * chromatic(uv, CHROMATIC_STRENGTH * 0.01);
	if (SCANLINES > 0.5) color.rgb *= (1.-SCAN_STRENGTH)+(sin(uv.y*1024.)*SCAN_STRENGTH);
	if (NOISE > 0.5) color.rgb += noise(uv) * NOISE_STRENGTH;
	if (VHS > 0.5) color += vhs(uv);
	if (VIGNETTE > 0.5) color.rgb *= vig(uv);

	// cutoff edges
	if (CRT > 0.5 && ( uv.x<0.||uv.y<0.||uv.x>1.||uv.y>1. ))
	{
		color.rgb *= 0.;
	}

	// Pre-multiply alpha since all runtime textures already are
	gl_FragColor = vec4(color.rgb,1.0);
}
