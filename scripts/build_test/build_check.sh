cp .config .config.old
date > ./build_test_result
# 64bit, builtin, byt/hsw/bdw/skl
#if [ 1 -ne 1 ];then
for filename in ./compile/configs_64_builtin/*
do
	echo $filename >> ./build_test_result
	cp $filename .config
	make arch=x86_64 -j 8 bzImage > ./build.log 2>&1
	if [ $? -ne 0 ];then
		echo "erro!" >> ./build_test_result
		break
	fi
done
#fi

#if [ 1 -ne 1 ];then
# 64bit, module, byt/hsw/bdw/skl
for filename in ./compile/configs_64_mod/*
do
	echo $filename >> ./build_test_result
	cp $filename .config
	make arch=x86_64 -j 8 deb-pkg > ./build.log 2>&1
	if [ $? -ne 0 ];then
		echo "erro!" >> ./build_test_result
		break
	fi
done
#fi

# 32bit, builtin, byt/hsw/bdw/skl
for filename in ./compile/configs_32_builtin/*
do
	echo $filename >> ./build_test_result
	cp $filename .config
	make arch=x86_32 -j 8 bzImage > ./build.log 2>&1
	if [ $? -ne 0 ];then
		echo "erro!" >> ./build_test_result
		break
	fi
done

# 32bit, module, byt/hsw/bdw/skl
for filename in ./compile/configs_32_mod/*
do
	echo $filename >> ./build_test_result
	cp $filename .config
	make arch=x86_32 -j 8 deb-pkg > ./build.log 2>&1
	if [ $? -ne 0 ];then
		echo "erro!" >> ./build_test_result
		break
	fi
done
cp .config.old .config

