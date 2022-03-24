<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="modalContent2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:400px;">
        <div class="modal-content">
            <form name="form_copy_data" method="post" action="?tpf=admin/board/process">
            <input type="hidden" name="mode" id="mode">
            <input type="hidden" name="code" id="code">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
            </div>
            <div class="modal-body">

            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 게시물 <span id="board_sub_title2"></span></p></h4>
            <table class="table table-bordered">
            <tr>
                <td class="menu">게시판 제목</td>
                <td align="left">
                <select name="board_code" id="board_code" class="form-control input-sm">
                <option value="">선택</option>
  <option value="1">공지사항</option>  <option value="2">자주하는 질문</option>  <option value="3">1:1 문의</option>                </select>
                </td>
            </tr>
            </table>
            </div>

            <div class="modal-footer">
            <button type="button" onclick="registerCopyData()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
            </div>
            </form>
        </div>
    </div>
</div>