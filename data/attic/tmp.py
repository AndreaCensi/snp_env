import numpy

arena_center = [0.15, 0.48]

posts = [
	[0.2159869 ,  0.23529284 ],
	[0.26938038,  0.73651523 ],
	[ -0.22548925,  0.8553097 ],
	[-0.30463551,  0.32364712, ],
]

for p in posts:
 	R = numpy.linalg.norm(numpy.array(p) - numpy.array(arena_center))
	print R