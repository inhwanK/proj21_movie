<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

dd, dl, dt {
    margin: 0;
    padding: 0;
}

form {
    display: block;
    margin-top: 0em;
}

input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}

input[type="hidden" i] {
    display: none;
    appearance: none;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

button, input {
    overflow: visible;
}

table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}

colgroup {
    display: table-column-group;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}


a.button {
    text-decoration: none;
}

h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}

.mb30 {
    margin-bottom: 30px!important;
}

.mypage-infomation {
    position: relative;
    min-height: 36px;
    padding-bottom: 10px;
}

.va-m {
    vertical-align: middle!important;
}


.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

.btn-group.right {
    text-align: right;
}

.mypage-infomation .btn-group {
    position: absolute;
    top: 0;
    right: 0;
    padding: 0;
    margin: 0;
}

.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #503396;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}

.button.purple {
    color: #fff;
    line-height: 36px;
    border: 0;
    background: #503396;
}

.btn-group .button {
    margin: 0 3px;
}

.agree-box {
    border: 1px solid #d8d9db;
    border-radius: 10px;
    margin-top: 30px;
}

.agree-box dl dt {
    position: relative;
    padding: 0 30px;
    border-bottom: 1px solid #d8d9db;
    height: 50px;
    line-height: 48px;
}

.bg-chk {
    display: inline-block;
    position: relative;
}

.mr10 {
    margin-right: 10px!important;
}

.agree-box dl dt span.bg-chk {
    float: left;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}

.board-form tbody th {
    background: #f7f8f9;
}

#contents {
    width: 70%;
    margin: 200px auto 0 auto;
    padding: 0;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<section>
		<div id="contents" class="">
				<h2 class="tit">1:1 문의</h2>
				<div class="mypage-infomation mb30">
					<ul class="dot-list">
						<li>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다. </li>
					</ul>

					<div class="btn-group right">
						<a href="#" class="button purple" id="myQnaBtn" title="나의 문의내역 페이지로 이동">나의 문의내역</a><!-- btn-layer-open -->
					</div>
				</div>

				<div class="agree-box">
					<dl>
						<dt>
							<span class="bg-chk mr10">
								<input type="checkbox" id="chk">
								<label for="chk"><strong>개인정보 수집에 대한 동의</strong></label>
							</span>

							<span class="font-orange">[필수]</span>
						</dt>
						<dd style="font-size:13px;">
							귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집·이용에 대한 본인동의가 필요한 항목입니다.<br><br>

							[개인정보의 수집 및 이용목적]<br>
							회사는 단체관람/대관 문의 내역의 확인, 요청사항 처리 또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br><br>

							[수집하는 개인정보의 항목]<br>
							이름, 연락처, 이메일 주소<br><br>

							[개인정보의 보유기간 및 이용기간]<br>
							<span class="ismsimp">문의 접수 ~ 처리 완료 후 6개월<br>
							(단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)<br>
							자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.</span>
						</dd>
					</dl>
				</div>

				<p class="reset mt10">* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우 서비스를 이용하실 수 없습니다</p>

				<p class="reset mt30 a-r font-orange">* 필수</p>

				<form name="regFrm" method="post">
					<input type="hidden" name="inqLclCd" value="INQD01">
					<input type="hidden" name="custInqStatCd" value="INQST1">
					<input type="hidden" name="cdLvl" value="3">
					<input type="hidden" name="fileNo" value="">

					<div class="table-wrap mt10">
						<table class="board-form va-m">
							<colgroup>
								<col style="width:150px;">
								<col>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">문의지점<em class="font-orange">*</em></th>
									<td colspan="3">
										<input type="radio" id="aq1" name="inqMclCd" value="QD01M01" data-cd="QD_BRCH_DIV_CD" checked="">
										<label for="aq1">지점문의</label>

										<div class="dropdown bootstrap-select small ml10 bs3"><select id="theater" class="small ml10" title="지역선택" tabindex="-98"><option class="bs-title-option" value=""></option>
											<option value="">지역선택</option>
											
												<option value="10">서울</option>
											
												<option value="30">경기</option>
											
												<option value="35">인천</option>
											
												<option value="45">대전/충청/세종</option>
											
												<option value="55">부산/대구/경상</option>
											
												<option value="65">광주/전라</option>
											
												<option value="70">강원</option>
											
												<option value="80">제주</option>
											
										</select><button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="theater" title="지역선택"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">지역선택</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
										<div class="dropdown bootstrap-select disabled small ml10 bs3"><select name="brchNo" id="theater02" class="small ml10" title="극장선택" disabled="disabled" tabindex="-98"><option class="bs-title-option" value=""></option>
											
										<option value="">극장선택</option></select><button type="button" class="btn dropdown-toggle disabled bs-placeholder btn-default" data-toggle="dropdown" role="button" data-id="theater02" tabindex="-1" aria-disabled="true" title="극장선택"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">극장선택</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox" style="max-height: 179.125px; overflow: hidden; min-height: 0px;"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1" style="max-height: 177.125px; overflow-y: auto; min-height: 0px;"><ul class="dropdown-menu inner "><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">극장선택</span></a></li></ul></div></div></div>

										<input type="radio" id="aq2" name="inqMclCd" class="ml20" value="QD01M02" data-cd="QD_ETC_DIV_CD">
										<label for="aq2">기타문의</label>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="ask-type">문의유형</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										<div class="dropdown bootstrap-select small bs3 dropup"><select name="inqSclCd" id="ask-type" class="small" tabindex="-98">
											
										<option value="">문의유형 선택</option><option value="QDBR01">일반문의</option><option value="QDBR02">칭찬</option><option value="QDBR03">불만</option><option value="QDBR04">제안</option></select><button type="button" class="btn dropdown-toggle bs-placeholder btn-default" data-toggle="dropdown" role="button" data-id="ask-type" title="문의유형 선택"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">문의유형 선택</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox" style="overflow: hidden;"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1" style="overflow-y: auto;"><ul class="dropdown-menu inner "><li class="selected active"><a role="option" aria-disabled="false" tabindex="0" class="selected active" aria-selected="true"><span class="text">문의유형 선택</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">일반문의</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">칭찬</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">불만</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">제안</span></a></li></ul></div></div></div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="name">이름</label> <em class="font-orange">*</em></th>
									<td><input type="text" id="name" name="inqurNm" class="input-text w150px" value="" maxlength="15"></td>
									<th scope="row"><label for="qnaRpstEmail">이메일</label> <em class="font-orange">*</em></th>
									<td><input type="text" name="rpstEmail" id="qnaRpstEmail" class="input-text" value="" maxlength="50"></td>
								</tr>
								<tr>
									<th scope="row"><label for="hpNum1">휴대전화</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										
											
											
												<input type="text" name="hpNum1" id="hpNum1" class="input-text w60px numType" maxlength="3" title="핸드폰번호 첫자리 입력">
												<span>-</span>
												<input type="text" name="hpNum2" id="hpNum2" class="input-text w70px numType" maxlength="4" title="핸드폰번호 중간자리 입력">
												<span>-</span>
												<input type="text" name="hpNum3" id="hpNum3" class="input-text w70px numType" maxlength="4" title="핸드폰번호 마지막자리 입력">
												<button id="btnQnaMblpCertNoSend" type="button" disabled="disabled" class="button gray w100px ml08 disabled">인증요청</button>
												<div id="qnaMblpNo-error-text" class="alert"></div>
											
										
									</td>
								</tr>
								
								<tr id="qnaMblpCertRow" style="display: none;">
									<th scope="row"><label for="ibxQnaMblpCharCertNo">인증번호</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										<div class="chk-num">
											<div class="line">
												<input maxlength="4" type="text" id="ibxQnaMblpCharCertNo" class="input-text w180px numType" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->
												<div id="qnaTimer" class="time-limit">3:00</div>
											</div>
										</div>
										<button id="btnQnaMblpCharCert" type="button" class="button purple w100px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
										<div id="qnaCertNo-error-text" class="alert"></div>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><label for="qnaCustInqTitle">제목</label> <em class="font-orange">*</em></th>
									<td colspan="3"><input type="text" name="custInqTitle" id="qnaCustInqTitle" class="input-text" maxlength="100"></td>
								</tr>
								<tr>
									<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										<div class="textarea">
											<textarea id="textarea" name="custInqCn" rows="5" cols="30" title="내용입력" placeholder="※ 불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다." class="input-textarea"></textarea>
											<div class="util">
												<p class="count">
													<span id="textareaCnt">0</span> / 2000
												</p>
											</div>
										</div>
									</td>
								</tr>
								<!-- 2019-02-14 사진첨부 마크업 수정 -->
								<tr>
									<th scope="row">사진첨부</th>
									<td colspan="3">
										<div class="upload-image-box">

											<div class="info-txt">
												<p>* JPEG, PNG 형식의 5M 이하의 파일만 첨부 가능합니다. (최대 5개)</p>

												<!-- to 개발 : 이미지 추가가 5개가 되면 버튼 숨김 -->
												<button type="button" id="uploadBtn" class="btn-image-add"><span>파일선택</span></button>
												<!--// to 개발 : 이미지 추가가 5개가 되면 버튼 숨김 -->
												<p>* 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
											</div>

											<div id="imgList"></div>

										</div>
									</td>
								</tr>
								<!--// 2019-02-14 사진첨부 마크업 수정 -->
							</tbody>
						</table>
					</div>

					<div class="btn-group pt40">
						<button type="submit" class="button purple large">등록</button>
					</div>
				</form>
			</div>
	</section>
</body>
</html>