######################################################################
# @author      : mauricio (mauricio@$HOSTNAME)
# @file        : Makefile
# @created     : Monday Mar 22, 2021 10:19:45 -03
######################################################################

main: 
	docker build -t jekyllrb .

.PHONY: clean

clean:
	docker rmi -q jekyllrb	

