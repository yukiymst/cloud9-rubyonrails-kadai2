module HitokotosHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_hitokotos_path
    elsif action_name == 'edit'
      hitokoto_path
    end
  end
end