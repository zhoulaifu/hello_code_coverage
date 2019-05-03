cov0:
	@echo "\n"getting coverage with gcc and lcov
	@echo "\n"Step 1
	gcc -fprofile-arcs -ftest-coverage greatest_of_three.c
	@echo "\n"Step 2
	./a.out
	@echo "\n"Step 3
	gcov greatest_of_three.c
	@echo "\n"Step 4: Generating coverage report
	lcov --capture --directory . --output-file a.info
	@echo "\n"Step 5: output  report in html to ./out
	genhtml a.info --output-directory out

cov1:
	@echo "\n"getting coverage with clang and llvm-cov in the gcov style
	@echo "\n"Step 1
	clang-6.0 -fprofile-arcs -ftest-coverage greatest_of_three.c
	@echo "\n"Step 2
	./a.out
	@echo "\n"Step 3
	llvm-cov-6.0 gcov -f -b greatest_of_three.gcda
cov2:
	@echo "\n"getting coverage with clang and llvm-cov, a different style from gcov
	@echo "\n"Step 1: Instrument and compile the program to prepare coverage profiling
	clang-6.0 -fprofile-instr-generate -fcoverage-mapping greatest_of_three.c
	@echo "\n"Step 2: Run the instrumented program to get the coverage as raw data
	./a.out
	@echo "\n"Step 4: organize, or index  the raw data
	llvm-profdata-6.0 merge  default.profraw -o a.profdata
	@echo "\n"Step 4: get coverage in visual
	llvm-cov-6.0 show ./a.out -instr-profile=a.profdata
	@echo "\n"Step 5 - optional: get coverage in report
	llvm-cov-6.0 report ./a.out -instr-profile=a.profdata

clean:
	rm -f *.gcov *.gcda *.gcno *.profdata *.profraw *.out
	rm -f *.html *.css *.png
