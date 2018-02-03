<!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">                
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <%-- 
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    --%>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="${home}">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <!-- user menu --> 
                        <li class="treeview">
                            <a href="${userList}">
                                <i class="fa fa-fw fa-user"></i> <span>User</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            <li><a href="${userList}"><i class="fa fa-user"></i>List Users</a></li>
                                <li><a href="${userAddForm}"><i class="fa fa-user"></i>Add New</a></li>
                            </ul>
                        </li>
						<!--user menu end -->
						<!-- role menu --> 
                        <li >
                            <a href="${roleList}">
                                <i class="fa fa-fw fa-users"></i> <span>Role</span>
                            </a>
                        </li>
						<!--role menu end -->
						<!-- groups menu -->
						<li >
                            <a href="${userGroups}">
                                <i class="fa fa-fw fa-group"></i> <span>Group</span>
                            </a>
                        </li>
                        <!-- group menu end -->
                        <!-- menu menu -->
						<li class="treeview">
                            <a href="${menus}">
                                <i class="fa fa-fw fa-list"></i> <span>Menus</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            <li><a href="${menus}"><i class="fa fa-user"></i>List Menus</a></li>
                                <li><a href="${menuAddForm}"><i class="fa fa-user"></i>Add New</a></li>
                            </ul>
                        </li>
                        <!-- menu menu end -->
                        <!-- categories menu -->
						<li class="treeview">
                            <a href="${categories}">
                                <i class="fa fa-fw fa-list"></i> <span>Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            <li><a href="${categories}"><i class="fa fa-user"></i>List Categories</a></li>
                                <li><a href="${categoryAddForm}"><i class="fa fa-user"></i>Add New</a></li>
                            </ul>
                        </li>
                        <!-- categories menu end -->
                        <%-- sub categories menu --%>
						<li class="treeview">
                            <a href="${subCategories}">
                                <i class="fa fa-fw fa-list"></i> <span>Sub Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            <li><a href="${subCategories}"><i class="fa fa-user"></i>List Sub Categories</a></li>
                                <li><a href="${subCategoryAddForm}"><i class="fa fa-user"></i>Add New</a></li>
                            </ul>
                        </li>
                        <%-- sub categories menu end --%>
                        <%-- article menu start --%>
						<li class="treeview">
                            <a href="${articles}">
                                <i class="fa fa-laptop"></i> <span>Article</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            <li><a href="${articles}"><i class="fa fa-user"></i>List Articles</a></li>
                                <li><a href="${articleContent}"><i class="fa fa-user"></i>Add New</a></li>
                            </ul>
                        </li>
                        <%-- article menu end --%>
                        <%-- Images menu start --%>
						<li class="treeview" >
                           <a href="${images}">
                                <i class="fa fa-laptop"></i> <span>Images</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            <li><a href="${images}"><i class="fa fa-laptop"></i>Images</a></li>
                            <li><a href="${imagesUploadFrom}"><i class="fa fa-laptop"></i>Image Upload</a></li>
                            </ul>
                        </li>
                        <%-- Images menu end --%>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>