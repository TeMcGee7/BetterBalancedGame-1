------------------------------------------------------------------------------
--	FILE:	 new_bbg_sv_2.sql
--	AUTHOR:  iElden, D. / Jack The Narrator
--	PURPOSE: Database modifications by new BBG
------------------------------------------------------------------------------
--==============================================================================================
--******				SV: FASTEST SETTING 			 								 ******
--==============================================================================================

DELETE FROM RequirementSets WHERE RequirementSetId='REQUIREMENTS_EXOPLANET_TECHNOLOGY_VICTORY';
DELETE FROM RequirementSets WHERE RequirementSetId='EXOPLANET_TECHNOLOGY_VICTORY_PER_TEAM_REQUIREMENTS';
DELETE FROM Requirements WHERE RequirementId='EXOPLANET_TECHNOLOGY_VICTORY_PER_TEAM_REQUIREMENTS_MET';
DELETE FROM Requirements WHERE RequirementId='TECHNOLOGY_VICTORY_MARS_BASE';
DELETE FROM Requirements WHERE RequirementId='TECHNOLOGY_VICTORY_EXOPLANET_EXPEDITION';
DELETE FROM RequirementArguments WHERE RequirementId='EXOPLANET_TECHNOLOGY_VICTORY_PER_TEAM_REQUIREMENTS_MET';
DELETE FROM RequirementArguments WHERE RequirementId='TECHNOLOGY_VICTORY_MARS_BASE';
DELETE FROM RequirementArguments WHERE RequirementId='TECHNOLOGY_VICTORY_EXOPLANET_EXPEDITION';
DELETE FROM Types WHERE Type='PROJECT_LAUNCH_MARS_BASE';
DELETE FROM Types WHERE Type='PROJECT_LAUNCH_EXOPLANET_EXPEDITION';
DELETE FROM Types WHERE Type='PROJECT_ORBITAL_LASER';
DELETE FROM Types WHERE Type='PROJECT_TERRESTRIAL_LASER';
DELETE FROM Types WHERE Type='PROJECT_RECOMMISSION_REACTOR';

INSERT OR IGNORE INTO Types
	(Type, 										Kind)
	VALUES
	('PROJECT_LAUNCH_MARS_REACTOR' , 			'KIND_PROJECT'),	
	('PROJECT_LAUNCH_MARS_HABITATION' , 		'KIND_PROJECT'),	
	('PROJECT_LAUNCH_MARS_HYDROPONICS' , 		'KIND_PROJECT');	
	
	
INSERT OR IGNORE INTO Projects
	(ProjectType, 								Name,											ShortName,												Description,										PopupText,											PrereqDistrict,					PrereqTech,					MaxPlayerInstances,			Cost,			AdvisorType,					SpaceRace,			VisualBuildingType)
	VALUES
	('PROJECT_LAUNCH_MARS_REACTOR' , 			'LOC_PROJECT_LAUNCH_MARS_REACTOR_NAME',			'LOC_PROJECT_LAUNCH_MARS_REACTOR_SHORT_NAME',			'LOC_PROJECT_LAUNCH_MARS_REACTOR_DESCRIPTION',		'LOC_PROJECT_LAUNCH_MARS_REACTOR_POPUP',			'DISTRICT_SPACEPORT',			'TECH_NUCLEAR_FUSION',		1,							1800,			'ADVISOR_TECHNOLOGY',			1,					'BUILDING_LARGE_ROCKET'),	
	('PROJECT_LAUNCH_MARS_HABITATION' , 		'LOC_PROJECT_LAUNCH_MARS_HABITATION_NAME',		'LOC_PROJECT_LAUNCH_MARS_HABITATION_SHORT_NAME',		'LOC_PROJECT_LAUNCH_MARS_HABITATION_DESCRIPTION',	'LOC_PROJECT_LAUNCH_MARS_HABITATION_POPUP',			'DISTRICT_SPACEPORT',			'TECH_ROBOTICS',			1,							1800,			'ADVISOR_TECHNOLOGY',			1,					'BUILDING_LARGE_ROCKET'),		
	('PROJECT_LAUNCH_MARS_HYDROPONICS' , 		'LOC_PROJECT_LAUNCH_MARS_HYDROPONICS_NAME',		'LOC_PROJECT_LAUNCH_MARS_HYDROPONICS_SHORT_NAME',		'LOC_PROJECT_LAUNCH_MARS_HYDROPONICS_DESCRIPTION',	'LOC_PROJECT_LAUNCH_MARS_HYDROPONICS_POPUP',		'DISTRICT_SPACEPORT',			'TECH_NANOTECHNOLOGY',		1,							1800,			'ADVISOR_TECHNOLOGY',			1,					'BUILDING_LARGE_ROCKET');		

INSERT OR IGNORE INTO ProjectPrereqs
	(ProjectType, 								PrereqProjectType, 				MinimumPlayerInstances)
	VALUES
	('PROJECT_LAUNCH_MARS_REACTOR' , 			'PROJECT_LAUNCH_MOON_LANDING',	1),	
	('PROJECT_LAUNCH_MARS_HABITATION' , 		'PROJECT_LAUNCH_MOON_LANDING',	1),	
	('PROJECT_LAUNCH_MARS_HYDROPONICS' , 		'PROJECT_LAUNCH_MOON_LANDING',	1);	

INSERT OR IGNORE INTO RequirementSets
	(RequirementSetId , 							RequirementSetType)
	VALUES
	('REQUIREMENTS_EXOPLANET_TECHNOLOGY_VICTORY' , 	'REQUIREMENTSET_TEST_ALL'),	
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS' , 		'REQUIREMENTSET_TEST_ALL');	
	
INSERT OR IGNORE INTO RequirementSetRequirements
	(RequirementSetId , 							RequirementId)
	VALUES
	('REQUIREMENTS_EXOPLANET_TECHNOLOGY_VICTORY' , 	'TECH_VICTORY_PER_TEAM_REQUIREMENTS_MET'),
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS' , 		'TECHNOLOGY_VICTORY_EARTH_SATELLITE'),	
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS' , 		'TECHNOLOGY_VICTORY_MOON_LANDING'),	
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS' , 		'TECHNOLOGY_VICTORY_MARS_REACTOR_MODULE'),
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS' , 		'TECHNOLOGY_VICTORY_MARS_HABITATION_MODULE'),	
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS' , 		'TECHNOLOGY_VICTORY_MARS_HYDROPONICS_MODULE');	

INSERT OR IGNORE INTO Requirements
	(RequirementId , 								RequirementType)
	VALUES
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS_MET' , 	'REQUIREMENT_COLLECTION_ANY_MET');
	
INSERT OR IGNORE INTO Requirements
	(RequirementId , 								RequirementType,								Persistent)
	VALUES	
	('TECHNOLOGY_VICTORY_EARTH_SATELLITE' , 		'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		1),	
	('TECHNOLOGY_VICTORY_MOON_LANDING' , 			'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		1),	
	('TECHNOLOGY_VICTORY_MARS_REACTOR_MODULE' , 	'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		1),	
	('TECHNOLOGY_VICTORY_MARS_HABITATION_MODULE' , 	'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		1),	
	('TECHNOLOGY_VICTORY_MARS_HYDROPONICS_MODULE', 	'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		1);	
	
INSERT OR IGNORE INTO RequirementArguments
	(RequirementId , 								Name,											Value)
	VALUES
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS_MET' , 	'CollectionType',								'COLLECTION_TEAM_PLAYERS'),
	('TECH_VICTORY_PER_TEAM_REQUIREMENTS_MET' , 	'RequirementSetId',								'TECH_VICTORY_PER_TEAM_REQUIREMENTS'),
	('TECHNOLOGY_VICTORY_EARTH_SATELLITE' , 		'ProjectType',									'PROJECT_LAUNCH_EARTH_SATELLITE'),	
	('TECHNOLOGY_VICTORY_MOON_LANDING' , 			'ProjectType',									'PROJECT_LAUNCH_MOON_LANDING'),	
	('TECHNOLOGY_VICTORY_MARS_REACTOR_MODULE' , 	'ProjectType',									'PROJECT_LAUNCH_MARS_REACTOR'),	
	('TECHNOLOGY_VICTORY_MARS_HABITATION_MODULE' , 	'ProjectType',									'PROJECT_LAUNCH_MARS_HABITATION'),	
	('TECHNOLOGY_VICTORY_MARS_HYDROPONICS_MODULE', 	'ProjectType',									'PROJECT_LAUNCH_MARS_HYDROPONICS');	
