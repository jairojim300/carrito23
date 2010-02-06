class ComprasController < ApplicationController
  # GET /compras
  # GET /compras.xml
  def index
    @compras = Compra.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @compras }
    end
  end

  # GET /compras/1
  # GET /compras/1.xml
  def show
    @compra = Compra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @compra }
    end
  end

  # GET /compras/new
  # GET /compras/new.xml
  def new
    @compra = Compra.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @compra }
    end
  end

  # GET /compras/1/edit
  def edit
    @compra = Compra.find(params[:id])
  end

  # POST /compras
  # POST /compras.xml
  def create
    @compra = Compra.new(params[:compra])

    respond_to do |format|
      if @compra.save
        flash[:notice] = 'Compra was successfully created.'
        format.html { redirect_to(@compra) }
        format.xml  { render :xml => @compra, :status => :created, :location => @compra }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @compra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /compras/1
  # PUT /compras/1.xml
  def update
    @compra = Compra.find(params[:id])

    respond_to do |format|
      if @compra.update_attributes(params[:compra])
        flash[:notice] = 'Compra was successfully updated.'
        format.html { redirect_to(@compra) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @compra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.xml
  def destroy
    @compra = Compra.find(params[:id])
    @compra.destroy

    respond_to do |format|
      format.html { redirect_to(compras_url) }
      format.xml  { head :ok }
    end
  end
end
