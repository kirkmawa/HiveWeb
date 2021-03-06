BEGIN;

INSERT INTO survey_choice VALUES
	('7749d4e2-2ab0-460c-b3fa-de123b402089', '6f38821c-1905-4d75-bd71-0ad21b2f187c', 1, 'moving', 'I''m moving'),
	('a4372da3-c664-42eb-9872-3a95cab7d0fd', '6f38821c-1905-4d75-bd71-0ad21b2f187c', 2, 'time', 'I don''t have time'),
	('001cf110-aca1-4b96-8253-f3b0590209bf', '6f38821c-1905-4d75-bd71-0ad21b2f187c', 3, 'money', 'I can''t justify the expense'),
	('b6927d1a-38ed-4962-98c5-83773c0c8c65', '6f38821c-1905-4d75-bd71-0ad21b2f187c', 4, 'other', NULL)
;

UPDATE survey_question SET question_text = 'Do you have any comments to share with us?' WHERE survey_question_id = '6560957a-b1ca-4757-93e3-313c5a22679a';
UPDATE survey_question SET question_text = 'Why are you leaving?' WHERE survey_question_id = '6f38821c-1905-4d75-bd71-0ad21b2f187c';

UPDATE survey
	SET
		title = 'Confirm Cancellation',
		name = 'member_cancel',
		json_data = '{"instructions":"Please fill out this brief survey to help us improve the Hive.","submit_button":"Confirm Membership Cancellation","submit_instructions":"Note that this is your official resignation from Hive13.  At the end of your subscription, your access will be automatically disabled."}'
	WHERE survey_id = 'c061cc14-0a56-4c6b-b589-32760c2e77f6';

COMMIT;
