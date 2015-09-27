class GroceriesController < ApplicationController
  before_action :set_grocery, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :new]

  # GET /groceries
  # GET /groceries.json
  def index
    @groceries = Grocery.all
  end

  # GET /groceries/1
  # GET /groceries/1.json
  def show
  end

  # GET /groceries/new
  def new
    @grocery = Grocery.new
  end

  # GET /groceries/1/edit
  def edit
  end

  # POST /groceries
  # POST /groceries.json
  def create
    @grocery = Grocery.new(grocery_params)
      if @grocery.save
        redirect_to root_url
      else
        render "new"
      end
   end

  # PATCH/PUT /groceries/1
  # PATCH/PUT /groceries/1.json
  def update
    if @grocery.update(grocery_params)
      redirect_to root_url
    else
      render "edit"
    end
  end

  # DELETE /groceries/1
  # DELETE /groceries/1.json
  def destroy
    @grocery.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Grocery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery
      @grocery = Grocery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grocery_params
      params.require(:grocery).permit(:title, :date, :description)
    end
end
