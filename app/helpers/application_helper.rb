# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Presenta el nombre del usuario y un vinvulo de salida para
  def mostrar_usuario
    if session[:usuario] and session[:usuario][:id]
      html = link_to(session[:usuario][:nombre], usuario_path(session[:usuario][:id]) )
      html << " "
      html << link_to("Salir", "/logout", :class => 'salir')
    else
      html = link_to "Ingresar", "/login", :class => "login"
    end

  end

  # determina si el usuario esta logueado y es administrador
  def admin?
    session[:usuario] and session[:usuario][:tipo] == 'admin'
  end
end
