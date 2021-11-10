-module(s1_geometry). %% 模块声明
-export([area/1]). %% 导出声明

area({rectangle,Width,Height}) -> Width * Height; %% 子句，以分号结束
area({square,Side}) -> Side * Side. %% 子句，以句号结束

