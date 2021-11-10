-module(p1_geometry). %% 模块声明
-export([area/1]). %% 导出声明

area({rectangle,Width,Height}) -> Width * Height; %% 子句，以分号结束
area({cicle,Radius}) -> 3.14159 * Radius * Radius;
area({triangle,Bottom,Height}) -> Bottom * Height / 2;
area({square,Side}) -> Side * Side. %% 子句，以句号结束

