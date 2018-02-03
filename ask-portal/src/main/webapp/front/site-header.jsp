<%@include file="header-includes.jsp" %>
<div class="row">
	<jsp:include page="up-coming.jsp"></jsp:include>
	<div class="col-lg-12 col-md-12 col-sm-12 navbar-collapse collapse" id="navbar-main" >
		<ul class="nav navbar-nav">
            <%-- <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Themes <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="themes">
                <li><a href="http://bootswatch.com/default/">Default</a></li>
                <li class="divider"></li>
                <li><a href="http://bootswatch.com/amelia/">Amelia</a></li>
                <li><a href="index.html">Cerulean</a></li>
                <li><a href="http://bootswatch.com/cosmo/">Cosmo</a></li>
                <li><a href="http://bootswatch.com/cyborg/">Cyborg</a></li>
                <li><a href="http://bootswatch.com/darkly/">Darkly</a></li>
                <li><a href="http://bootswatch.com/flatly/">Flatly</a></li>
                <li><a href="http://bootswatch.com/journal/">Journal</a></li>
                <li><a href="http://bootswatch.com/lumen/">Lumen</a></li>
                <li><a href="http://bootswatch.com/readable/">Readable</a></li>
                <li><a href="http://bootswatch.com/simplex/">Simplex</a></li>
                <li><a href="http://bootswatch.com/slate/">Slate</a></li>
                <li><a href="http://bootswatch.com/spacelab/">Spacelab</a></li>
                <li><a href="http://bootswatch.com/superhero/">Superhero</a></li>
                <li><a href="http://bootswatch.com/united/">United</a></li>
                <li><a href="http://bootswatch.com/yeti/">Yeti</a></li>
              </ul>
            </li> --%>
            <c:forEach items="${menus}" var="menu" >
            <li>
              <a href='${home}?mid=<c:out value="${menu.id}" />'  ><c:out value="${menu.label}"></c:out> </a>
            </li>
            </c:forEach>
          </ul>
	
	</div>
</div>