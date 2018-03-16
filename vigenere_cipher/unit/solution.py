#!/usr/bin/env python

def CorrectPath(s): #bruteforce ftw!
	import random
	while True:
		route=[]
		tracepos=[]
		x=1;y=5;answer=1
		for i in s:
			if i=="?":i=random.choice("lrud")
			if i=="u":y+=1
			elif i=="d":y-=1
			elif i=="r":x+=1
			elif i=="l":x-=1
			if (x,y) in tracepos:
				answer=0
				break
			else: tracepos.append((x,y))
			route.append(i)
			if x==6 or x==0 or y==0 or y==6:
				answer=0
				break
		if x==5 and y==1 and answer==1:
			return "".join(route)

print CorrectPath(raw_input())
