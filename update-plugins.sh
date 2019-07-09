#!/usr/bin/env bash

for pldir in autoload/*/ bundle/*/
do
	git -C "$pldir" pull origin master
done
