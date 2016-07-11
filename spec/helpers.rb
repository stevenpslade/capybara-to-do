module Helpers

  def log_in_with(email, password)
    visit(user_session_path)
    within('#new_user') do
        fill_in('Email', with: email)
        fill_in('Password', with: password)
    end
    click_on('Log in')
  end

end