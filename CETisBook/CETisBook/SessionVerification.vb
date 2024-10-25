Imports System.Web

Public Class SessionVerification
    Public Shared Sub VerifyAdminSession()
        Dim context As HttpContext = HttpContext.Current

        If context.Session("Admin") IsNot Nothing AndAlso context.Session("Admin").ToString() = "1" Then
            ' Muestra contenido para el rol "Admin"
            ' Aquí puedes agregar lógica adicional para la página de administración
        ElseIf context.Session("User") IsNot Nothing AndAlso context.Session("User").ToString() = "1" Then
            ' Muestra contenido para el rol "User" (otros usuarios)
            ' Aquí puedes agregar lógica adicional para la página de usuario
        Else
            ' Comprueba si el mensaje ya se mostró
            If context.Session("AlertShown") Is Nothing Then
                ' Registrando el script JavaScript para mostrar el mensaje
                Dim script As String = "alert('No tienes una sesión activa. Serás redirigido a la página de inicio de sesión.'); window.location.href = 'Login.aspx';"
                context.Response.Write("<script>" & script & "</script>")

                ' Establece una variable de sesión para indicar que el mensaje ya se mostró
                context.Session("AlertShown") = True
            End If

            ' Redirige al usuario a la página de inicio de sesión
            context.Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
