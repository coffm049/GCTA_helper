

test (){
	local a=$1
	local b=$2
	declare -a A=($b $a )

	for i in  "${A[@]}"
	do
		echo $i
	done
}



test2() {
	local a=$1
	local b=$2

	echo $((a + b))
}


