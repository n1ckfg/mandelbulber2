/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Fractal formula created by Buddhi
 */

/* ### This file has been autogenerated. Remove this line, to prevent override. ### */

inline void Mandelbulb3Iteration(float3 *z, sExtendedAuxCl *aux)
{
	aux->r_dz = aux->r_dz * 2.0f * aux->r;

	float temp, tempR;

	float sign = 1.0f;
	float sign2 = 1.0f;

	if (z->x < 0.0f) sign2 = -1.0f;
	tempR = native_sqrt(mad(z->x, z->x, z->y * z->y)); //+ 1e-061f
	*z *= native_recip(tempR);
	temp = mad(z->x, z->x, -z->y * z->y);
	z->y = 2.0f * z->x * z->y;
	z->x = temp;
	*z *= tempR;

	if (z->x < 0.0f) sign = -1.0f;
	tempR = native_sqrt(mad(z->x, z->x, z->z * z->z)); //+ 1e-061f
	*z *= native_recip(tempR);
	temp = mad(z->x, z->x, -z->z * z->z);
	z->z = 2.0f * z->x * z->z * sign2;
	z->x = temp * sign;
	*z *= tempR;

	*z *= aux->r;
}