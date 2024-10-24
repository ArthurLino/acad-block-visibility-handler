(defun c:TEST ()
  (setq selections_list ( list ))
  (setq current_selection_first_point ( getpoint ))
  (setq current_selection_second_point ( getpoint ))
  (setq selections_list ( append selections_list ( list current_selection_first_point current_selection_second_point)))

)