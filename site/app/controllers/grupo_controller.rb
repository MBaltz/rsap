class GrupoController < ApplicationController

	#TODO: todas as checageens de grupo, creio que o model já ta todo ok


	def index
		@grupos = Grupo.all
	end

	def new
		@grupo = Grupo.new
	end

	def show
	end

	def edit
	end

	def create
		@grupo = Grupo.new(grupo_params)
		respond_to do |format|
			if @grupo.save
				format.html { redirect_to grupos_url, notice: 'Grupo was successfully created.' }
			else
				format.html { render :new }
			end
		end
		@grupo.addUser(current_user)
	end

	def update
		respond_to do |format|
			if @grupo.update(grupo_params)
				format.html { redirect_to  grupos_url, notice: 'Grupo was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end


	def destroy
		@grupo.destroy
		respond_to do |format|
			format.html { redirect_to '/home', notice: 'Grupo was successfully destroyed.' }
		end
	end

	def gruposDe()
		grupos = Grupo.all
		grupos.each do |g|
			users = g.getUsers()
			users.each do |u|
				if( u.getId == params[:id])
					@grupo << g
					break;
				end
			end
		end
		redirect_to grupos_path
	end


	private
	def grupo_params
		params.require(:grupo).permit(:nome, :descricao)
	end

end