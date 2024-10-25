(defun c:TEST ()
  ; creates a list
  (setq selections_list ( list ))
  ; gets user-defined number of selections 
  (setq i (getint "Digite o número de seleções: "))
  (princ "Clique nas extremidades que enquadram sua seleção: ")
  ; loop to get selection-defining points *i* times
  (repeat i 
    (setq current_selection_first_point ( getpoint ))
    (setq current_selection_second_point ( getpoint ))
    (setq selections_list ( append selections_list ( list current_selection_first_point current_selection_second_point)))
  )
  ; loops through list points to get each selections and its length
  (if (= i 1)
    (
      (setq objects_inside_selection (ssget "W" (nth 0 selections_list) (nth 1 selections_list)))
      (prompt "\nNumero de elementos na seleção:")
      (princ (sslength objects_inside_selection))
      (setq objects_inside_selection nil)
    )
    (repeat (/ i 2)
      (setq objects_inside_selection (ssget "W" (nth (- (* i 2) 2) selections_list) (nth (- (* i 2) 1) selections_list)))
      (prompt "\nNumero de elementos na seleção:")
      (princ (sslength objects_inside_selection))
      (setq objects_inside_selection nil)
    )
  )
  (setq selections_list nil)
)