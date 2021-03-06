
# 반복문
# $(ls) 를 통해 원래 쉘에서 사용하던 명령어를 사용가능함.
# 현재 폴더에 있는 파일들을 ls명령어로 불러들여 반복분에 사용.

for var in $(ls)
do
	# ${#변수} 문법은 변수의 문자열 크기를 알 수 있는 명령어다.
  # 많은 파일이 있는데 압축풀기 해야하는 파일들의 문자열 크기가 13이라서 이렇게 사용함.
    
    
	if [ ${#var} == 13 ]
	then
		echo $var
        
        # ditto // 옵션  // 파일명.zip // 압출 풀 폴더
        # ${var}를 통해 파일명을 그대로 입력
        # 압축 풀 폴더는 확장자 빼고 이름 그대로 잘라서 사용하는 문법.
        
		$(ditto -V -x -k --sequesterRsrc --rsrc ${var} ./${var:0:9})
	
    	else
		continue
	fi

done
