<%@ tag pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<%@ attribute name="id" required="true" type="java.lang.String"%>
<%@ attribute name="pager" required="true" type="org.smart4j.framework.dao.bean.Pager"%>
<c:set var="pageNumber" value="${pager.pageNumber}" />
<c:set var="pageSize" value="${pager.pageSize}" />
<c:set var="totalRecord" value="${pager.totalRecord}" />
<c:set var="totalPage" value="${pager.totalPage}" />

<div class="css-row">
	<div class="css-right">
		<div id="${id}">
			<!--  <span>每页记录数:</span>
            ${pageSize} -->
			<div class="css-button-group ext-pager-button">
				<c:choose>
					<c:when test="${pageNumber > 1 && pageNumber <= totalPage}">
						<button  class="btn btn-xs btn-danger" type="button" onclick="next_page(1);"  data-pn="1">|第一页</button>
						<button  class="btn btn-xs btn-danger" type="button" onclick="next_page(${pageNumber - 1});"  data-pn="${pageNumber - 1}">&lt;上一页</button>
					</c:when>
					<c:otherwise>
						<button  class="btn btn-xs btn-danger" type="button" disabled>|&lt;首页</button>
						<button  class="btn btn-xs btn-danger" type="button" disabled>&lt;上一页</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageNumber < totalPage}">
						<button  class="btn btn-xs btn-danger"  type="button"  onclick="next_page(${pageNumber + 1});" data-pn="${pageNumber + 1}">下一页&gt;</button>
						<button  class="btn btn-xs btn-danger"  type="button"  onclick="next_page(${totalPage});"  data-pn="${totalPage}">最后一页&gt;|</button>
					</c:when>
					<c:otherwise>
						<button  class="btn btn-xs btn-danger" type="button" disabled>下一页&gt;</button>
						<button  class="btn btn-xs btn-danger" type="button" disabled>最后一页&gt;|</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>