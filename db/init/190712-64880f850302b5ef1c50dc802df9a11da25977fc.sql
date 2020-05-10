# bundles table

ALTER TABLE `axisplan_wholesale`.`bundles` 
ADD INDEX `fk_bundles_1_idx` (`purchase_id` ASC),
ADD INDEX `fk_bundles_2_idx` (`place_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`bundles` 
ADD CONSTRAINT `fk_bundles_1`
  FOREIGN KEY (`purchase_id`)
  REFERENCES `axisplan_wholesale`.`purchases` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_bundles_2`
  FOREIGN KEY (`place_id`)
  REFERENCES `axisplan_wholesale`.`places` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

# bundles_categories table

ALTER TABLE `axisplan_wholesale`.`bundles_categories` 
ADD INDEX `fk_bundles_categories_1_idx` (`bundle_id` ASC),
ADD INDEX `fk_bundles_categories_2_idx` (`category_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`bundles_categories` 
ADD CONSTRAINT `fk_bundles_categories_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_bundles_categories_2`
  FOREIGN KEY (`category_id`)
  REFERENCES `axisplan_wholesale`.`categories` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

# bundles_exports

ALTER TABLE `axisplan_wholesale`.`bundles_exports` 
ADD CONSTRAINT `fk_bundles_exports_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
;

# bundles_grades table

ALTER TABLE `axisplan_wholesale`.`bundles_grades` 
ADD INDEX `fk_bundles_grades_1_idx` (`bundle_id` ASC),
ADD INDEX `fk_bundles_grades_2_idx` (`grade_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`bundles_grades` 
ADD CONSTRAINT `fk_bundles_grades_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_bundles_grades_2`
  FOREIGN KEY (`grade_id`)
  REFERENCES `axisplan_wholesale`.`grades` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

# bundles_m3 table

ALTER TABLE `axisplan_wholesale`.`bundles_m3` 
ADD CONSTRAINT `fk_bundles_m3_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
;

# bundles_shapes table

ALTER TABLE `axisplan_wholesale`.`bundles_shapes` 
ADD INDEX `fk_bundles_shapes_1_idx` (`bundle_id` ASC),
ADD INDEX `fk_bundles_shapes_2_idx` (`shape_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`bundles_shapes` 
ADD CONSTRAINT `fk_bundles_shapes_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_bundles_shapes_2`
  FOREIGN KEY (`shape_id`)
  REFERENCES `axisplan_wholesale`.`shapes` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

ALTER TABLE `axisplan_wholesale`.`bundles_size` 
ADD INDEX `fk_bundles_size_1_idx` (`bundle_id` ASC),
ADD INDEX `fk_bundles_size_2_idx` (`size_id` ASC)
;

# bundles_size table

ALTER TABLE `axisplan_wholesale`.`bundles_size` 
ADD CONSTRAINT `fk_bundles_size_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_bundles_size_2`
  FOREIGN KEY (`size_id`)
  REFERENCES `axisplan_wholesale`.`size` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

# operation_histories table

ALTER TABLE `axisplan_wholesale`.`operation_histories` 
ADD INDEX `fk_operation_histories_1_idx` (`bundle_id` ASC),
ADD INDEX `fk_operation_histories_2_idx` (`state_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`operation_histories` 
ADD CONSTRAINT `fk_operation_histories_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_operation_histories_2`
  FOREIGN KEY (`state_id`)
  REFERENCES `axisplan_wholesale`.`states` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

# purchases table

ALTER TABLE `axisplan_wholesale`.`purchases` 
ADD INDEX `fk_purchases_1_idx` (`vendor_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`purchases` 
ADD CONSTRAINT `fk_purchases_1`
  FOREIGN KEY (`vendor_id`)
  REFERENCES `axisplan_wholesale`.`vendors` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE
;

# reservations table

ALTER TABLE `axisplan_wholesale`.`reservations` 
ADD INDEX `fk_reservations_1_idx` (`bundle_id` ASC)
;

ALTER TABLE `axisplan_wholesale`.`reservations` 
ADD CONSTRAINT `fk_reservations_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
;

# sales table

ALTER TABLE `axisplan_wholesale`.`sales` 
ADD CONSTRAINT `fk_sales_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
;

# stocks table

ALTER TABLE `axisplan_wholesale`.`stocks` 
ADD CONSTRAINT `fk_stocks_1`
  FOREIGN KEY (`bundle_id`)
  REFERENCES `axisplan_wholesale`.`bundles` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
;
