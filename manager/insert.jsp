<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Insert</title>
</head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
	function randomPassword() {
		var seedChar = new Array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
				'j', 'k', 'm', 'n', 'p', 'Q', 'r', 's', 't', 'u', 'v', 'w',
				'x', 'y', 'z');
		var seed = new Array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
				'k', 'm', 'n', 'p', 'Q', 'r', 's', 't', 'u', 'v', 'w', 'x',
				'y', 'z', '2', '3', '4', '5', '6', '7', '8', '9');//数组
		seedlength = seed.length;//数组长度

		j = Math.floor(Math.random() * seedChar.length);
		var createPassword = seedChar[j];
		for (i = 0; i < 5; i++) {
			j = Math.floor(Math.random() * seedlength);
			createPassword += seed[j];
		}
		return createPassword;
	};
	$().ready(function() {
		var s = randomPassword();
		$(".pname").val(s);
	});
</script>
<body>
	<form action="insert" method="post">
		<table border="0px" style="font-family: serif;font-size: 12px;">
			<tr>
				<td>gname:</td>
				<td><input type="text" name="gname">
				</td>
			</tr>
			<tr>
				<td>pname:</td>
				<td><input class="pname" type="text" name="pname">
				</td>
			</tr>
			<tr>
				<td>startid:</td>
				<td><input type="text" name="startid" value="0">
				</td>
			</tr>
			<tr>
				<td>cacheNum:</td>
				<td><input type="text" name="cacheNum" value="1000">
				</td>
			</tr>
			<tr>
				<td>totalNum:</td>
				<td><input type="text" name="totalNum" value="30317338">
				</td>
			</tr>
			<tr>
				<td>runnum:</td>
				<td><input type="text" name="runNum" value="10">
				</td>
			</tr>
			<tr>
				<td>count:</td>
				<td><input type="text" name="count" value="1">
				</td>
			</tr>

			<tr>
				<td>datas:</td>
				<td><input type="text" name="datas" value="1,1,0,0,0,0">
				</td>
			</tr>
			<tr>
				<td>readTable:</td>
				<td><input type="text" name="readTable" value="users">
				</td>
			</tr>
			<tr>
				<td>writeTable:</td>
				<td><input type="text" name="writeTable">
				</td>
			</tr>

			<tr>
				<td>testUrl:</td>
				<td><input type="text" name="testUrl">
				</td>
			</tr>
			<tr>
				<td>testStr:</td>
				<td><input type="text" name="testStr">
				</td>
			</tr>
			<tr>
				<td>others:</td>
				<td><input type="text" name="other">
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="保存">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>