/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Formula invented by Benesi
 * @reference http://www.fractalforums.com/index.php?action=profile;u=1170
 */

/* ### This file has been autogenerated. Remove this line, to prevent override. ### */

#ifndef DOUBLE_PRECISION
void BenesiIteration(float4 *z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	Q_UNUSED(fractal);

	float4 c = aux->const_c;
	aux->r_dz = aux->r_dz * 2.0f * aux->r;
	float r1 = mad(z->y, z->y, z->z * z->z);
	float newx;
	if (c.x < 0.0f || z->x < native_sqrt(r1))
	{
		newx = mad(z->x, z->x, -r1);
	}
	else
	{
		newx = mad(-z->x, z->x, r1);
	}
	r1 = -native_rsqrt(r1) * 2.0f * fabs(z->x);
	float newy = r1 * (mad(z->y, z->y, -z->z * z->z));
	float newz = r1 * 2.0f * z->y * z->z;

	z->x = newx;
	z->y = newy;
	z->z = newz;
}
#else
void BenesiIteration(double4 *z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	Q_UNUSED(fractal);

	double4 c = aux->const_c;
	aux->r_dz = aux->r_dz * 2.0 * aux->r;
	double r1 = mad(z->y, z->y, z->z * z->z);
	double newx;
	if (c.x < 0.0 || z->x < native_sqrt(r1))
	{
		newx = mad(z->x, z->x, -r1);
	}
	else
	{
		newx = mad(-z->x, z->x, r1);
	}
	r1 = -1.0 / native_sqrt(r1) * 2.0 * fabs(z->x);
	double newy = r1 * (mad(z->y, z->y, -z->z * z->z));
	double newz = r1 * 2.0 * z->y * z->z;

	z->x = newx;
	z->y = newy;
	z->z = newz;
}
#endif