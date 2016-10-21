<%@include file="../include/head.jsp" %>

<%@include file="../include/navbar.jsp" %>

<div class="wrapper">
    <div class="container">
        <h1>Users</h1>

        <div class="content">
            <button type="button" class="btn btn-primary float-xs-right clearfix" data-toggle="modal" data-target="#new-user-modal">
                Create a new user
            </button>

            <table id="users-table" class="table table-striped" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th class="username">Username</th>
                        <th class="email">Email</th>
                    </tr>
                </thead>
            </table>

            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}">Go home</a>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="new-user-modal" tabindex="-1" role="dialog" aria-labelledby="new-user-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="new-user-modal-label">Create a new user</h4>
            </div>
            <div class="modal-body">

                <form class="form-signin" method="post">
                    <label for="inputUsername">Username</label>
                    <input name="username" id="inputUsername" class="form-control" placeholder="Username" required autofocus>

                    <label for="inputEmail">Email</label>
                    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required>

                    <label for="inputPassword">Password</label>
                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary create-new-user" data-dismiss="modal">Create</button>
            </div>
        </div>
    </div>
</div>

<script src="//code.jquery.com/jquery-1.12.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script src="//cdn.datatables.net/1.10.12/js/dataTables.bootstrap4.min.js"></script>

<script>
var usersTable = jQuery('#users-table').DataTable({
    columns: [
        { "data": "username" },
        { "data": "email" }
    ],
    ajax: {
        url: "${pageContext.request.contextPath}/api/users",
        dataSrc: ""
    }
})

$(".create-new-user").on("click", function () {
    var user = {
        username: $("[name=username]").val(),
        email: $("[name=email]").val(),
        password: $("[name=password]").val()
    }

    $.post("${pageContext.request.contextPath}/auth/register", user)
            .done(function () {
                usersTable.ajax.reload();
            })
})
</script>

<%@include file="../include/footer.jsp" %>