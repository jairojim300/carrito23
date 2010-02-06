# coding: utf-8

class UsuariosController < ApplicationController
  # Verifica la sesion del usuario solo las acciones :index y :destroy, ver app/controllers/application_controller.rb
  before_filter :verificar_session, :only => [:index, :destroy]
  # Verifica el tipo de usuario, exeptuando las acciones :index y :destroy
  before_filter :verificar_tipo_usuario, :except => [:index, :destroy]

  # GET /usuarios
  # GET /usuarios.xml
  def index
    @usuarios = Usuario.all

    # Este metodo permite que se pueda responder en varios formatos
    # por ejemplo si se accede a 
    # http://localhost:3000/usuarios.html se obtiene una version HTML
    # http://localhost:3000/usuarios.xml se obtiene una version XML
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.xml
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end

  end

  # GET /usuarios/new
  # GET /usuarios/new.xml
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  # GET /usuarios/1/edit
  # Verificacion de que esta logueado el usuario para editar
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.xml
  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        flash[:notice] = 'Usuario was successfully created.'
        format.html { redirect_to(@usuario) }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.xml
  def update
    # Proteccion, borrar todos los parametros en caso de que se creen de otra forma
    [:pass, :pass_confirmation, :login, :tipo].each{ |v| params[:usuario].delete(v) }

    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'Usuario was successfully updated.'
        format.html { redirect_to(@usuario) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end

private
  # Verifica que tipo de usuario es y si esta logueado
  def verificar_tipo_usuario
    if session[:usuario].nil? or session[:usuario][:id].nil?
      redirect_to "/"
    else
      params[:id] = session[:usuario][:id] unless session[:usuario][:tipo] == 'admin'
    end
  end
end
