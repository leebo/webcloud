<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="me.bcloud.web.domain.JobConfig"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>List</title>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
	td {
	width: 100px;
	font-family: monospace;
}
</style>
</head>
<body>

	<script type="text/javascript">
		function edit(gname)
		{
		   // var old1=$("#" + gname).children(".edit");
			$("#" + gname).children(".edit").html("<a href=\"javascript:update(\'" + gname + "\')\">update</a> | <a href=\"javascript:cancel()\">cancel</a>");
			var cid=0;
			//var old=$("#" + gname).children(".pline");
			$("#" + gname).children(".pline").each(function (index)
			{
				var content=$(this).html();
				cid++;
				$(this).html("<input style='width: 50%; font-size: 12px;' type='text' value='" + content + "' id='text" + cid + "'>");
			});
		}
		
		function cancel()
		{
			$('input[id^="text"]').each(function (index)
			{
				var content=$(this).val();
				
				$(this).replaceWith(content);
			});
		}
	
	
		function update(gname)
		{
			$.post("edit","id=" + $("#text1").val() + "&pname=" + $("#text2").val() + "&gname=" + $("#text3").val() + "&startid=" + $("#text4").val() + "&totalNum=" + $("#text5").val() + "&runNum=" + $("#text6").val() + "&cacheNum=" + $("#text7").val() +"&datas=" + $("#text8").val() + "&count=" + $("#text9").val() + "&readTable=" + $("#text10").val() + "&writeTable=" + $("#text11").val() + "&testUrl=" + $("#text12").val() + "&testStr=" + $("#text13").val()   ,function(data)
			{
			    if (data){
			   		 var id=$("#text1").val();
					$('input[id^="text"]').each(function (index)
					{
						var content=$(this).val();
						$(this).replaceWith(content);
					});
					
					$("#" + gname).children(".edit").html("<a href=\"javascript:edit('" + id  + "')\">edit</a>");
					alert("更新成功");
				}
			});
		}
		
		function del(jobid)
		{
			$.post("delete?id=" + jobid,function(data)
			{
				if(data=="yes")
				{
					$("#" +jobid).hide('slow');
				}
			});
		}
		
		function opened(isOpen,jobId)
		{
			$.post("open?id=" + jobId + "&open=" + isOpen,function(data)
			{
				if(data=="yes")
				{
					$("#" + jobId).children(".pInput").children(".iscloseCheckBox").attr("onclick","opened(" + (isOpen==1?0:1) + "," + jobId + ")");
				}
			});
		}
	</script>

	<span class="">计数:${online}</span>
	<span>当前时间:<%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()) %></span>
	<table cellpadding="0px"  id="list" border="0px" style="font-size: 14px; font-family:Verdana, sans-serif;">
		<tr class="title" bgcolor="blue" style="font-size: 16px; color: white" >
			<td>id</td>
			<td>pname</td>
			<td>gname</td>
			<td>startid</td>
			<td>totalNum</td>
			<td>runNum</td>
			<td>cacheNum</td>
			<td>datas</td>
			<td>count</td>
			<td>readTable</td>
			<td>writeTable</td>
			<td>testUrl</td>
			<td>testStr</td>
			<td>open</td>
			<td>edit</td>
			<td>delete</td>
			<td>resultcount</td>
			<td>dayofcount</td>
			<td>lastwrite</td>
		</tr>

		<c:forEach items="${jobconfigs}" varStatus="status" var="jc">
			<tr id="${jc.id}">
				<td class="pline">${jc.id}</td>
				<td class="pline">${jc.pname}</td>
				<td class="pline">${jc.gname}</td>
				<td class="pline">${jc.startid}</td>
				<td class="pline">${jc.totalNum}</td>
				<td class="pline">${jc.runNum}</td>
				<td class="pline">${jc.cacheNum}</td>
				<td class="pline">${jc.datas}</td>
				<td class="pline">${jc.count}</td>
				<td class="pline">${jc.readTable}</td>
				<td class="pline">${jc.writeTable}</td>
				<td class="pline">${jc.testUrl}</td>
				<td class="pline">${jc.testStr}</td>

				<td class="pInput"><input class="iscloseCheckBox" value='${jc.isOpen()?"1":"0"}'
					${jc.isOpen()?"checked='true' ":""} type="checkbox"
					onclick="opened(${!jc.isOpen()?1:0},${jc.id})"></td>
				<td class="edit"><a href="javascript:edit('${jc.id}')">edit</a>
				</td>
				<td><a href="javascript:del('${jc.id}')">delete</a>
				</td>
				<td>${countList[status.count-1]}</td>
				<td>${dayOfCountList[status.count-1]}</td>
				<td>${lastWriteList[status.count-1]}</td>
			</tr>

		</c:forEach>
	</table>
	<h1>
		<a href="/webCloud/manager/insert.jsp">insert</a>
	</h1>
</body>
</html>
