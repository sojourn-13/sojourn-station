// Credits to Nickr5 for the useful procs I've taken from his library resource.
// This file is quadruple wrapped for your pleasure
// (

//"fancy" math for calculating time in ms from tick_usage percentage and the length of ticks
//percent_of_tick_used * (ticklag * 100(to convert to ms)) / 100(percent ratio)
//collapsed to percent_of_tick_used * tick_lag
#define TICK_DELTA_TO_MS(percent_of_tick_used) ((percent_of_tick_used) * world.tick_lag)
#define TICK_USAGE_TO_MS(starting_tickusage) (TICK_DELTA_TO_MS(TICK_USAGE_REAL - starting_tickusage))

#define R_IDEAL_GAS_EQUATION       8.31    // kPa*L/(K*mol).
#define ONE_ATMOSPHERE             101.325 // kPa.
#define IDEAL_GAS_ENTROPY_CONSTANT 1164    // (mol^3 * s^3) / (kg^3 * L).

// Gas-to-reagent conversion factor for breathing
#define REAGENT_GAS_EXCHANGE_FACTOR 50

// Radiation constants.
#define STEFAN_BOLTZMANN_CONSTANT    5.6704e-8 // W/(m^2*K^4).
#define COSMIC_RADIATION_TEMPERATURE 3.15      // K.
#define AVERAGE_SOLAR_RADIATION      200       // W/m^2. Kind of arbitrary. Really this should depend on the sun position much like solars.
#define RADIATOR_OPTIMUM_PRESSURE    3771      // kPa at 20 C. This should be higher as gases aren't great conductors until they are dense. Used the critical pressure for air.
#define GAS_CRITICAL_TEMPERATURE     132.65    // K. The critical point temperature for air.

#define RADIATOR_EXPOSED_SURFACE_AREA_RATIO 0.04 // (3 cm + 100 cm * sin(3deg))/(2*(3+100 cm)). Unitless ratio.
#define HUMAN_EXPOSED_SURFACE_AREA          5.2 //m^2, surface area of 1.7m (H) x 0.46m (D) cylinder

#define T0C  273.15 //    0.0 degrees celcius
#define T20C 293.15 //   20.0 degrees celcius
#define TCMB 2.7    // -270.3 degrees celcius

#define NUM_E 2.71828183

#define M_PI						3.1416
#define SQRT_2					1.414214
#define INFINITY				1.#INF // tg uses 1e31, not ready to change this
#define SYSTEM_TYPE_INFINITY	1.#INF //only for isinf check

#define SHORT_REAL_LIMIT 16777216

#define SQRTWO 1.414

/// Returns the difference between num1 and num2.
#define GET_DIFFERENCE(num1, num2) (num1 - num2)

/// Returns multiplicative inverse of num1.
#define GET_MULT_INVERSE(num1) (1/num1)

/// Returns the difference between multiplier and the product of multiplier * multiplicand.
#define MULT_DIFFERENCE(multiplier, multiplicand) ((multiplier * multiplicand) - multiplier)

/// Returns the higher of multiplicand and check, then multiplies it with multiplier.
#define SAFEMULT(multiplier, multiplicand, check) ((max(multiplier, check)) * multiplicand)

/// Returns the higher of dividend and check, then divides it with divisor.
#define SAFEDIVIDE(dividend, divisor, check) ((max(dividend, check)) / divisor)

/// Subtracts num1 from 360. Useful for degrees and angles and such.
#define SUBTRACT_FROM_360(num1) (360-num1)

#define PERCENT(val) (round((val)*100, 0.1))
#define CLAMP01(x) (CLAMP(x, 0, 1))

#define CEILING(x, y) ( -round(-(x) / (y)) * (y) )

#define ROUND_UP(x) ( -round(-(x)))

// round() acts like floor(x, 1) by default but can't handle other values
#define FLOOR(x, y) ( round((x) / (y)) * (y) )

#define QUANTIZE(variable) (round(variable, 0.0001))

#define CLAMP(CLVALUE,CLMIN,CLMAX) ( max( (CLMIN), min((CLVALUE), (CLMAX)) ) )

#define ZERO_OR_MORE(CLVALUE) CLAMP(CLVALUE, 0, INFINITY)

// Similar to clamp but the bottom rolls around to the top and vice versa. min is inclusive, max is exclusive
#define WRAP(val, min, max) ( min == max ? min : (val) - (round(((val) - (min))/((max) - (min))) * ((max) - (min))) )

// Real modulus that handles decimals
#define MODULUS(x, y) ( (x) - (y) * round((x) / (y)) )

// Tangent
#define TAN(x) (sin(x) / cos(x))

// Cotangent
#define COT(x) (1 / TAN(x))

// Secant
#define SEC(x) (1 / cos(x))

// Cosecant
#define CSC(x) (1 / sin(x))

#define ATAN2(x, y) ( !(x) && !(y) ? 0 : (y) >= 0 ? arccos((x) / sqrt((x)*(x) + (y)*(y))) : -arccos((x) / sqrt((x)*(x) + (y)*(y))) )

// Greatest Common Divisor - Euclid's algorithm
/proc/Gcd(a, b)
	return b ? Gcd(b, (a) % (b)) : a

// Least Common Multiple
#define Lcm(a, b) (abs(a) / Gcd(a, b) * abs(b))

#define INVERSE(x) ( 1/(x) )

#define IS_CARDINAL(x) ((x & (x - 1)) == 0)

// Used for calculating the radioactive strength falloff
#define INVERSE_SQUARE(initial_strength,cur_distance,initial_distance) ( (initial_strength)*((initial_distance)**2/(cur_distance)**2) )

// Inverts the sign of the given number.
#define INVERT_SIGN(number) ((number)*-1)

// Vector algebra.
#define SQUAREDNORM(x, y) (x**2 + y**)

#define NORM(x, y) (sqrt(SQUAREDNORM(x, y)))

#define ISPOWEROFTWO(val) ((val & (val-1)) == 0)

#define ROUNDUPTOPOWEROFTWO(val) (2 ** -round(-log(2, val)))

#define ISABOUTEQUAL(a, b, deviation) (deviation ? abs((a) - (b)) <= deviation : abs((a) - (b)) <= 0.1)

#define ISEVEN(x) (x % 2 == 0)

#define ISODD(x) (x % 2 != 0)

//Probability based rounding that makes whole numbers out of decimals based on luck.
//The decimal value is the probability to be rounded up.
//Eg a value of 1.37 has a 37% chance to become 2, otherwise it is 1
//Useful for game balance matters where the gulf caused by consistent rounding is too much
#define ROUND_PROB(val) (val - (val % 1) + prob((val % 1) * 100))

#define RAND_DECIMAL(lower, upper) (rand(0, upper - lower) + lower)

// Returns true if val is from min to max, inclusive.
#define ISINRANGE(val, min, max) (min <= val && val <= max)

// Same as above, exclusive.
#define ISINRANGE_EX(val, min, max) (min < val && val < max)

#define ISINTEGER(x) (round(x) == x)

#define ISMULTIPLE(x, y) ((x) % (y) == 0)

// Performs a linear interpolation between a and b.
// Note that amount=0 returns a, amount=1 returns b, and
// amount=0.5 returns the mean of a and b.
// amount outside of [0, 1] produces values outside of [a, b] linearly.
#define LERP(a, b, amount) ((a) + ((b) - (a)) * (amount))
// Inverse of the linear interpolation given the same a and b.
#define UNLERP(amount, a, b) (((amount) - (a)) / ((b) - (a)))
//
#define REMAP(amount, a1, b1, a2, b2) (((amount) - (a1)) / ((b1) - (a1)) * ((b2) - (a2)) + (a2))

// Returns the nth root of x.
#define ROOT(n, x) ((x) ** (1 / (n)))

// The quadratic formula. Returns a list with the solutions, or an empty list
// if they are imaginary.
/proc/SolveQuadratic(a, b, c)
	ASSERT(a)
	. = list()
	var/d		= b*b - 4 * a * c
	var/bottom  = 2 * a
	if(d < 0)
		return
	var/root = sqrt(d)
	. += (-b + root) / bottom
	if(!d)
		return
	. += (-b - root) / bottom

#define TODEGREES(radians) ((radians) * 57.2957795)

#define TORADIANS(degrees) ((degrees) * 0.0174532925)

// Will filter out extra rotations and negative rotations
// E.g: 540 becomes 180. -180 becomes 180.
#define SIMPLIFY_DEGREES(degrees) (MODULUS((degrees), 360))

#define GET_ANGLE_OF_INCIDENCE(face, input) (MODULUS((face) - (input), 360))

//Finds the shortest angle that angle A has to change to get to angle B. Aka, whether to move clock or counterclockwise.
/proc/closer_angle_difference(a, b)
	if(!isnum(a) || !isnum(b))
		return
	a = SIMPLIFY_DEGREES(a)
	b = SIMPLIFY_DEGREES(b)
	var/inc = b - a
	if(inc < 0)
		inc += 360
	var/dec = a - b
	if(dec < 0)
		dec += 360
	. = inc > dec? -dec : inc

//A logarithm that converts an integer to a number scaled between 0 and 1.
//Currently, this is used for hydroponics-produce sprite transforming, but could be useful for other transform functions.
#define TRANSFORM_USING_VARIABLE(input, max) ( sin((90*(input))/(max))**2 )

//converts a uniform distributed random number into a normal distributed one
//since this method produces two random numbers, one is saved for subsequent calls
//(making the cost negligble for every second call)
//This will return +/- decimals, situated about mean with standard deviation stddev
//68% chance that the number is within 1stddev
//95% chance that the number is within 2stddev
//98% chance that the number is within 3stddev...etc
#define ACCURACY 10000
/proc/gaussian(mean, stddev)
	var/static/gaussian_next
	var/R1;var/R2;var/working
	if(gaussian_next != null)
		R1 = gaussian_next
		gaussian_next = null
	else
		do
			R1 = rand(-ACCURACY,ACCURACY)/ACCURACY
			R2 = rand(-ACCURACY,ACCURACY)/ACCURACY
			working = R1*R1 + R2*R2
		while(working >= 1 || working==0)
		working = sqrt(-2 * log(working) / working)
		R1 *= working
		gaussian_next = R2 * working
	return (mean + stddev * R1)
#undef ACCURACY

/proc/get_turf_in_angle(angle, turf/starting, increments)
	var/pixel_x = 0
	var/pixel_y = 0
	for(var/i in 1 to increments)
		pixel_x += sin(angle)+16*sin(angle)*2
		pixel_y += cos(angle)+16*cos(angle)*2
	var/new_x = starting.x
	var/new_y = starting.y
	while(pixel_x > 16)
		pixel_x -= 32
		new_x++
	while(pixel_x < -16)
		pixel_x += 32
		new_x--
	while(pixel_y > 16)
		pixel_y -= 32
		new_y++
	while(pixel_y < -16)
		pixel_y += 32
		new_y--
	new_x = CLAMP(new_x, 0, world.maxx)
	new_y = CLAMP(new_y, 0, world.maxy)
	return locate(new_x, new_y, starting.z)

// Returns a list where [1] is all x values and [2] is all y values that overlap between the given pair of rectangles
/proc/get_overlap(x1, y1, x2, y2, x3, y3, x4, y4)
	var/list/region_x1 = list()
	var/list/region_y1 = list()
	var/list/region_x2 = list()
	var/list/region_y2 = list()

	// These loops create loops filled with x/y values that the boundaries inhabit
	// ex: list(5, 6, 7, 8, 9)
	for(var/i in min(x1, x2) to max(x1, x2))
		region_x1["[i]"] = TRUE
	for(var/i in min(y1, y2) to max(y1, y2))
		region_y1["[i]"] = TRUE
	for(var/i in min(x3, x4) to max(x3, x4))
		region_x2["[i]"] = TRUE
	for(var/i in min(y3, y4) to max(y3, y4))
		region_y2["[i]"] = TRUE

	return list(region_x1 & region_x2, region_y1 & region_y2)

/proc/Mean(...)
	var/sum = 0
	for(var/val in args)
		sum += val
	return sum / args.len

// )

// Round up
proc/n_ceil(var/num)
	if(isnum(num))
		return round(num)+1
