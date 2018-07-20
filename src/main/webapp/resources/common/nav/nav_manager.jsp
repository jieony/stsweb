<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.tab_menu ul li.res a{color : #a1a1a1;font-weight: bold;}
.tab_menu ul li.res:hover a,
.tab_menu ul  li.res a.active_tab{color: #000000;}
</style>

<!-- 탭메뉴 -->
<div class="tab_menu">
  <ul>
   <li class="res" >
    <a class="active_tab" href="/manager_penalty.do">예약관리</a>        
   </li>
   <li class="res">
    <a href="/manager_memlist.do">회원목록</a>
   </li>
   <li class="res">
    <a href="/manager_asklist.do">맛집요청</a>
   </li>
   <li class="res">
    <a href="/manager_reslist.do">맛집목록</a>
   </li>
  </ul>
</div>

