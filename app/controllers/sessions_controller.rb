class SessionsController < ApplicationController
    def new
        
    end
    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password]) #로그인이 성공했을 때
            session[:user_id] = user.id
            
            redirect_to contents_path
        else #로그인이 실패했을 때
            flash[:alert] = '아이디나 비밀번호를 잘못 입력하셨습니다.'
            render 'new'
        end
    end
    def destroy
        session.delete(:user_id)
        @current_user = nil
        
        redirect_to contents_path
    end
end
