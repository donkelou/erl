-module(s2_geometry). %% 模块声明
-export([test/0,area/1]). %% 导出声明

%% 添加测试函数
test() ->
	12 = area({rectangle,3,4}),
	144 = area({square,12}),
	tests_worked.

area({rectangle,Width,Height}) -> Width * Height; %% 子句，以分号结束
area({square,Side}) -> Side * Side. %% 子句，以句号结束

