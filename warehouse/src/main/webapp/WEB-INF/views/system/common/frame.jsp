<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<div class="col-md-4" style="height: 500px;">
    <iframe id="westFrame" name="westFrame" src="${wsdc}/${westFrameUrl}" width="100%" height="100%" frameborder="0"
            scrolling="auto"></iframe>
</div>
<div class="col-md-8" style="height: 550px;">
    <iframe id="centerFrame" name="centerFrame" src="" width="100%" height="100%" frameborder="0"
            scrolling="no"></iframe>
</div>

<script src="${wsdc}/js/jquery-1.10.1.js" type="text/javascript"></script>
<script src="${wsdc}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${wsdc}/js/jquery.layout-latest.js" type="text/javascript"></script>
<script src="${wsdc}/js/jquery.ui.all.js" type="text/javascript"></script>
