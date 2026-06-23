-- CreateEnum
CREATE TYPE "ImageRole" AS ENUM ('THUMBNAIL', 'DEMONSTRATION', 'VIDEO', 'MUSCLE_MAP', 'DIAGRAM', 'HIGHLIGHT', 'AVATAR', 'PROGRESS_PHOTO');

-- CreateEnum
CREATE TYPE "PrioritySide" AS ENUM ('LEFT', 'RIGHT', 'BOTH');

-- CreateEnum
CREATE TYPE "MuscleSize" AS ENUM ('SMALL', 'MEDIUM', 'LARGE');

-- CreateEnum
CREATE TYPE "MuscleRole" AS ENUM ('PRIMARY', 'SECONDARY', 'STABILIZER');

-- CreateEnum
CREATE TYPE "MovementRole" AS ENUM ('PRIMARY', 'ASSISTS');

-- CreateEnum
CREATE TYPE "MovementPlane" AS ENUM ('SAGITTAL', 'FRONTAL', 'TRANSVERSE');

-- CreateEnum
CREATE TYPE "MuscleGroup" AS ENUM ('PUSH', 'PULL', 'LEGS', 'UPPER_BODY', 'ARMS', 'BACK', 'CHEST', 'DELTS', 'MIX');

-- CreateEnum
CREATE TYPE "Split" AS ENUM ('NO_SPLIT', 'PUSH_PULL_LEGS', 'BRO_SPLIT', 'UPPER_LOWER', 'SEVEN_DAYS', 'OTHER');

-- CreateEnum
CREATE TYPE "SessionStatus" AS ENUM ('NO_STATUS', 'PLANNED', 'ACTIVE', 'COMPLETED', 'SKIPPED', 'PARTIAL');

-- CreateEnum
CREATE TYPE "TipCategory" AS ENUM ('NO_CATEGORY', 'NUTRITION', 'SUPPLEMENT', 'TECHNIQUE', 'HEALTH');

-- CreateEnum
CREATE TYPE "MeasurementContext" AS ENUM ('STANDALONE', 'PRE_WORKOUT', 'POST_WORKOUT', 'MORNING', 'EVENING');

-- CreateEnum
CREATE TYPE "PRType" AS ENUM ('ESTIMATED_1RM', 'HEAVIEST_SET', 'MAX_REPS', 'MAX_VOLUME_SESSION');

-- CreateEnum
CREATE TYPE "SetType" AS ENUM ('WORKING', 'WARMUP', 'DROP', 'BACKOFF', 'FAILURE');

-- CreateEnum
CREATE TYPE "ROM" AS ENUM ('FULL', 'LOWER', 'UPPER');

-- CreateEnum
CREATE TYPE "Sex" AS ENUM ('MALE', 'FEMALE');

-- CreateEnum
CREATE TYPE "ClashSeverity" AS ENUM ('NO_CLASH', 'TINY', 'MEDIUM', 'HIGH', 'CRITICAL', 'AVOID', 'SPACE');

-- CreateEnum
CREATE TYPE "WeeklyFrequency" AS ENUM ('STOPPED', 'ONCE_WEEKLY', 'TWICE_WEEKLY', 'THREE_TIMES_WEEKLY', 'EVERY_OTHER_DAY', 'DAILY', 'TWICE_DAILY', 'THREE_TIMES_DAILY', 'WORKOUT_DAYS_ONLY');

-- CreateEnum
CREATE TYPE "DayTiming" AS ENUM ('FASTED_WAKE', 'MEAL_1', 'MEAL_2', 'MEAL_3', 'PRE_WORKOUT', 'INTRA_WORKOUT', 'POST_WORKOUT', 'PRE_SLEEP');

-- CreateEnum
CREATE TYPE "MealTiming" AS ENUM ('BEGGINNING', 'MIDDLE', 'END');

-- CreateEnum
CREATE TYPE "MealType" AS ENUM ('FASTING', 'PROTEIN', 'CARBS', 'FATS', 'FIBERS', 'SUGAR');

-- CreateEnum
CREATE TYPE "CofactorType" AS ENUM ('ENHANCES_ABSORPTION', 'ENHANCES_EFFICACY', 'REQUIRED_TOGETHER', 'SYNERGISTIC_EFFECT');

-- CreateEnum
CREATE TYPE "MedicalConditionCategory" AS ENUM ('CARDIOVASCULAR', 'RENAL', 'METABOLIC', 'RESPIRATORY', 'ENDOCRINE', 'NEUROLOGICAL', 'GASTROINTESTINAL', 'MUSCULOSKELETAL', 'HEMATOLOGIC', 'PSYCHIATRIC', 'REPRODUCTIVE', 'OTHER');

-- CreateEnum
CREATE TYPE "TrainingGoal" AS ENUM ('HYPERTROPHY', 'STRENGTH', 'FAT_LOSS', 'ENDURANCE', 'RECOMPOSITION', 'MAINTENANCE');

-- CreateEnum
CREATE TYPE "LeverCategory" AS ENUM ('PERFORMANCE', 'RECOVERY', 'COMPOSITION', 'HORMONAL', 'COGNITIVE', 'STRUCTURAL', 'NUTRITIONAL_GAP');

-- CreateEnum
CREATE TYPE "HormonalEffectDirection" AS ENUM ('SUPPORTS', 'SUPPRESSES', 'MODULATES');

-- CreateEnum
CREATE TYPE "EvidenceTier" AS ENUM ('STRONG', 'MODERATE', 'LIMITED', 'EMERGING');

-- CreateEnum
CREATE TYPE "RiskTolerance" AS ENUM ('CONSERVATIVE', 'STANDARD', 'AGGRESSIVE');

-- CreateEnum
CREATE TYPE "DietaryPattern" AS ENUM ('OMNIVORE', 'VEGETARIAN', 'VEGAN');

-- CreateEnum
CREATE TYPE "SensitivityLevel" AS ENUM ('INTOLERANT', 'SENSITIVE', 'NORMAL', 'RESISTANT');

-- CreateEnum
CREATE TYPE "FoodInteractionType" AS ENUM ('ENHANCES_ABSORPTION', 'REQUIRES_PRESENCE', 'REDUCES_ABSORPTION', 'REQUIRES_AVOIDANCE', 'DELAYS_ABSORPTION');

-- CreateEnum
CREATE TYPE "OccupationalActivity" AS ENUM ('SEDENTARY', 'STANDING', 'ACTIVE', 'MIXED');

-- CreateEnum
CREATE TYPE "PreferenceDirection" AS ENUM ('MUST_INCLUDE', 'EXCLUDE');

-- CreateEnum
CREATE TYPE "ConsentType" AS ENUM ('TERMS_OF_SERVICE', 'HEALTH_DATA_PROCESSING', 'MARKETING', 'AI_DATA_USAGE');

-- CreateEnum
CREATE TYPE "ErasureScope" AS ENUM ('HEALTH_DATA_ONLY', 'FULL_ACCOUNT');

-- CreateEnum
CREATE TYPE "DoseStatus" AS ENUM ('PENDING', 'TAKEN', 'SKIPPED', 'MISSED');

-- CreateEnum
CREATE TYPE "QuantityUnit" AS ENUM ('GRAMS', 'CAPSULES', 'MILLILITERS');

-- CreateTable
CREATE TABLE "UserConsent" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "consentType" "ConsentType" NOT NULL,
    "granted" BOOLEAN NOT NULL,
    "consentVersion" TEXT NOT NULL,
    "grantedAt" TIMESTAMP(3),
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "UserConsent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DataErasureRequest" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "scope" "ErasureScope" NOT NULL,
    "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),
    "notes" TEXT,

    CONSTRAINT "DataErasureRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AIUsageLog" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "feature" TEXT NOT NULL,
    "modelUsed" TEXT NOT NULL,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AIUsageLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exercise" (
    "id" TEXT NOT NULL,
    "exerciseDayId" TEXT NOT NULL,
    "exerciseTemplateId" TEXT,
    "dayPosition" INTEGER NOT NULL,
    "isBFR" BOOLEAN NOT NULL DEFAULT false,
    "title" TEXT,
    "description" TEXT,
    "gripId" INTEGER,
    "equipmentId" INTEGER,
    "normalThumb" BOOLEAN,
    "prioritySide" "PrioritySide",
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Exercise_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserEquipment" (
    "userId" TEXT NOT NULL,
    "equipmentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "UserEquipment_pkey" PRIMARY KEY ("userId","equipmentId")
);

-- CreateTable
CREATE TABLE "SetSpec" (
    "id" TEXT NOT NULL,
    "setNum" INTEGER NOT NULL,
    "setType" "SetType" NOT NULL DEFAULT 'WORKING',
    "reps" TEXT,
    "leftWeight" DOUBLE PRECISION,
    "rightWeight" DOUBLE PRECISION,
    "minBreakSec" INTEGER,
    "maxBreakSec" INTEGER,
    "isWarmup" BOOLEAN NOT NULL DEFAULT false,
    "asymmetryPct" DOUBLE PRECISION,
    "rangeOfMotion" "ROM" NOT NULL DEFAULT 'FULL',
    "angle" INTEGER,
    "eccentric" INTEGER,
    "pauseBottom" INTEGER,
    "concentric" INTEGER,
    "pauseTop" INTEGER,
    "completed" BOOLEAN NOT NULL DEFAULT true,
    "actualLeftWeight" DOUBLE PRECISION,
    "actualRightWeight" DOUBLE PRECISION,
    "actualReps" INTEGER,
    "actualBreakSec" INTEGER,
    "actualPerformanceTimeSec" INTEGER,
    "actualEccentric" INTEGER,
    "actualPauseBottom" INTEGER,
    "actualConcentric" INTEGER,
    "actualPauseTop" INTEGER,
    "isCheated" BOOLEAN NOT NULL DEFAULT false,
    "estimated1RM" DOUBLE PRECISION,
    "exerciseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "SetSpec_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Grip" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageURL" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Grip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "imageURL" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExerciseType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "ExerciseType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommonAngle" (
    "id" SERIAL NOT NULL,
    "degree" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CommonAngle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rep" (
    "id" SERIAL NOT NULL,
    "range" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Rep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "alt" TEXT,
    "mimeType" TEXT NOT NULL,
    "widthPx" INTEGER,
    "heightPx" INTEGER,
    "sizeBytes" INTEGER,
    "order" INTEGER NOT NULL DEFAULT 0,
    "role" "ImageRole" NOT NULL,
    "exerciseTypeId" INTEGER,
    "muscleId" INTEGER,
    "gripId" INTEGER,
    "equipmentId" INTEGER,
    "userId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Muscle" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "fibreType1Pct" INTEGER,
    "fibreType2Pct" INTEGER,
    "benefitFromBFR" BOOLEAN NOT NULL DEFAULT false,
    "recoveryHours" INTEGER,
    "sizeClass" "MuscleSize",
    "originId" INTEGER,
    "insertionId" INTEGER,
    "parentId" INTEGER,
    "diagramUrl" TEXT,
    "highlightUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Muscle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Movement" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "plane" "MovementPlane",
    "technique" TEXT,
    "demoUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Movement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MuscleMovement" (
    "muscleId" INTEGER NOT NULL,
    "movementId" INTEGER NOT NULL,
    "role" "MovementRole" NOT NULL DEFAULT 'PRIMARY',

    CONSTRAINT "MuscleMovement_pkey" PRIMARY KEY ("muscleId","movementId")
);

-- CreateTable
CREATE TABLE "MuscleEndRegion" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "imageURL" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "MuscleEndRegion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExerciseTypeMuscle" (
    "exerciseTypeId" INTEGER NOT NULL,
    "muscleId" INTEGER NOT NULL,
    "role" "MuscleRole" NOT NULL DEFAULT 'SECONDARY',

    CONSTRAINT "ExerciseTypeMuscle_pkey" PRIMARY KEY ("exerciseTypeId","muscleId")
);

-- CreateTable
CREATE TABLE "ExerciseDay" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "date" TIMESTAMP(3) NOT NULL,
    "isBFR" BOOLEAN NOT NULL DEFAULT false,
    "prioriyMuscles" "MuscleGroup"[],
    "notes" TEXT,
    "startedAt" TIMESTAMP(3),
    "finishedAt" TIMESTAMP(3),
    "allowNotification" BOOLEAN NOT NULL DEFAULT false,
    "status" "SessionStatus" NOT NULL DEFAULT 'PLANNED',
    "totalTonnageKg" DOUBLE PRECISION,
    "totalSets" INTEGER,
    "totalReps" INTEGER,
    "durationMinutes" INTEGER,
    "mesoId" TEXT,

    CONSTRAINT "ExerciseDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Mesocycle" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endDate" TIMESTAMP(3),
    "notes" TEXT,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "split" "Split",
    "allowNotification" BOOLEAN NOT NULL DEFAULT false,
    "isDeload" BOOLEAN NOT NULL DEFAULT false,
    "volumeModifier" DOUBLE PRECISION,
    "intensityModifier" DOUBLE PRECISION,
    "scheduleId" TEXT NOT NULL,

    CONSTRAINT "Mesocycle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Schedule" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "allowNotification" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "measurementUnit" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "aliases" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "SupplementType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementDoseRange" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "sex" "Sex",
    "minAgeYears" INTEGER,
    "maxAgeYears" INTEGER,
    "medicalConditionId" INTEGER,
    "isPregnant" BOOLEAN,
    "lowerLimit" DOUBLE PRECISION,
    "upperLimit" DOUBLE PRECISION,
    "toleranceLimit" DOUBLE PRECISION,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,

    CONSTRAINT "SupplementDoseRange_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementCoFactor" (
    "supplementAId" INTEGER NOT NULL,
    "supplementBId" INTEGER NOT NULL,
    "type" "CofactorType" NOT NULL,
    "reason" TEXT NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,

    CONSTRAINT "SupplementCoFactor_pkey" PRIMARY KEY ("supplementAId","supplementBId")
);

-- CreateTable
CREATE TABLE "SupplementClash" (
    "id" TEXT NOT NULL,
    "supplementAId" INTEGER NOT NULL,
    "supplementBId" INTEGER NOT NULL,
    "medicalConditionId" INTEGER,
    "severity" "ClashSeverity" NOT NULL,
    "evidenceTier" "EvidenceTier" NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,
    "reason" TEXT NOT NULL,
    "minSpacingHours" INTEGER,

    CONSTRAINT "SupplementClash_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MedicalCondition" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "category" "MedicalConditionCategory",
    "aliases" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "MedicalCondition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementMedicalConditionClash" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "medicalConditionId" INTEGER NOT NULL,
    "severity" "ClashSeverity" NOT NULL,
    "evidenceTier" "EvidenceTier" NOT NULL,
    "reason" TEXT NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,

    CONSTRAINT "SupplementMedicalConditionClash_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Medication" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "aliases" TEXT[],

    CONSTRAINT "Medication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementMedicationClash" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "medicationId" INTEGER NOT NULL,
    "severity" "ClashSeverity" NOT NULL,
    "evidenceTier" "EvidenceTier" NOT NULL,
    "reason" TEXT NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,
    "onlyAboveDose" DOUBLE PRECISION,
    "minSpacingHours" DOUBLE PRECISION,

    CONSTRAINT "SupplementMedicationClash_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Allergen" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "aliases" TEXT[],

    CONSTRAINT "Allergen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementAllergen" (
    "supplementTypeId" INTEGER NOT NULL,
    "allergenId" INTEGER NOT NULL,
    "severity" "ClashSeverity" NOT NULL DEFAULT 'AVOID',
    "evidenceTier" "EvidenceTier" NOT NULL,
    "reason" TEXT NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,

    CONSTRAINT "SupplementAllergen_pkey" PRIMARY KEY ("supplementTypeId","allergenId")
);

-- CreateTable
CREATE TABLE "Hormone" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "aliases" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Hormone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementHormonalEffect" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "hormoneId" INTEGER NOT NULL,
    "direction" "HormonalEffectDirection" NOT NULL,
    "evidenceTier" "EvidenceTier" NOT NULL,
    "reason" TEXT,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,

    CONSTRAINT "SupplementHormonalEffect_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Food" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "aliases" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Food_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementFoodInteraction" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "mealType" "MealType",
    "foodId" INTEGER,
    "mealTiming" "MealTiming",
    "type" "FoodInteractionType" NOT NULL,
    "reason" TEXT NOT NULL,
    "minSpacingHours" INTEGER,
    "sourceUrl" TEXT NOT NULL,
    "verifiedAt" TIMESTAMP(3) NOT NULL,
    "verifiedBy" TEXT,

    CONSTRAINT "SupplementFoodInteraction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementUsageTip" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "tip" TEXT NOT NULL,
    "dayTiming" "DayTiming",
    "mealTiming" "MealTiming",
    "sourceUrl" TEXT,
    "verifiedAt" TIMESTAMP(3),

    CONSTRAINT "SupplementUsageTip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementDose" (
    "id" TEXT NOT NULL,
    "userSupplementId" TEXT NOT NULL,
    "scheduledDate" TIMESTAMP(3) NOT NULL,
    "dayTiming" "DayTiming" NOT NULL,
    "status" "DoseStatus" NOT NULL DEFAULT 'PENDING',
    "takenAt" TIMESTAMP(3),
    "skipReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "SupplementDose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplementProtocolPhase" (
    "id" TEXT NOT NULL,
    "userSupplementId" TEXT NOT NULL,
    "phaseOrder" INTEGER NOT NULL,
    "durationDays" INTEGER NOT NULL,
    "dailyDose" DOUBLE PRECISION NOT NULL,
    "weeklyFrequency" "WeeklyFrequency" NOT NULL,

    CONSTRAINT "SupplementProtocolPhase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SetSpecTemplate" (
    "id" TEXT NOT NULL,
    "exerciseTemplateId" TEXT NOT NULL,
    "setNum" INTEGER NOT NULL,
    "reps" TEXT,
    "targetLeftWeight" DOUBLE PRECISION,
    "targetRightWeight" DOUBLE PRECISION,
    "minBreakSec" INTEGER,
    "maxBreakSec" INTEGER,
    "eccentric" INTEGER,
    "pauseBottom" INTEGER,
    "concentric" INTEGER,
    "pauseTop" INTEGER,

    CONSTRAINT "SetSpecTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExerciseTemplate" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "typeId" INTEGER NOT NULL,
    "gripId" INTEGER,
    "equipmentId" INTEGER,
    "normalThumb" BOOLEAN NOT NULL DEFAULT true,
    "prioritySide" "PrioritySide" NOT NULL DEFAULT 'BOTH',
    "isBFR" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "isSystem" BOOLEAN NOT NULL DEFAULT true,
    "createdBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ExerciseTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExerciseDayTemplate" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "date" TIMESTAMP(3) NOT NULL,
    "isBFR" BOOLEAN NOT NULL DEFAULT false,
    "prioriyMuscles" "MuscleGroup"[],
    "notes" TEXT,
    "startTime" TIMESTAMP(3),
    "endTime" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ExerciseDayTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MesocycleTemplate" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endDate" TIMESTAMP(3),
    "notes" TEXT,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "split" "Split",
    "allowNotification" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "scheduleTemplateId" TEXT NOT NULL,

    CONSTRAINT "MesocycleTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScheduleTemplate" (
    "id" TEXT NOT NULL,

    CONSTRAINT "ScheduleTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProgressSnapshot" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "weekStart" TIMESTAMP(3) NOT NULL,
    "weightKg" DOUBLE PRECISION,
    "bodyFatPct" DOUBLE PRECISION,
    "totalSets" INTEGER NOT NULL DEFAULT 0,
    "totalReps" INTEGER NOT NULL DEFAULT 0,
    "totalTonnageKg" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "sessionsCompleted" INTEGER NOT NULL DEFAULT 0,
    "sessionsPlanned" INTEGER NOT NULL DEFAULT 0,
    "topLifts" JSONB NOT NULL,
    "streakDays" INTEGER NOT NULL DEFAULT 0,
    "weeklyAdherence" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "avgRPE" DOUBLE PRECISION,
    "avgSleepQuality" DOUBLE PRECISION,
    "avgEnergyLevel" DOUBLE PRECISION,
    "deloadWeek" BOOLEAN NOT NULL DEFAULT false,
    "computedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProgressSnapshot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExerciseTypeFrequency" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "exerciseTypeId" INTEGER NOT NULL,
    "mesocycleId" TEXT NOT NULL,
    "weekNumber" INTEGER NOT NULL,
    "count" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "ExerciseTypeFrequency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProgressionEvent" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "exerciseTypeId" INTEGER NOT NULL,
    "previousWeight" DOUBLE PRECISION NOT NULL,
    "newWeight" DOUBLE PRECISION NOT NULL,
    "reason" TEXT,
    "occurredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProgressionEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserStats" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "peakWeightKg" DOUBLE PRECISION,
    "peakTonnageWeekKg" DOUBLE PRECISION,
    "longestStreak" INTEGER NOT NULL DEFAULT 0,
    "totalWorkouts" INTEGER NOT NULL DEFAULT 0,
    "totalTonnageKg" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "memberSince" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PersonalRecord" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "exerciseTypeId" INTEGER NOT NULL,
    "type" "PRType" NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "setSpecId" TEXT,
    "achievedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,

    CONSTRAINT "PersonalRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BodyMeasurement" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "exerciseDayId" TEXT,
    "context" "MeasurementContext" NOT NULL DEFAULT 'STANDALONE',
    "measuredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "weightKg" DOUBLE PRECISION,
    "bodyFatPct" DOUBLE PRECISION,
    "muscleMassKg" DOUBLE PRECISION,
    "neck" DOUBLE PRECISION,
    "chest" DOUBLE PRECISION,
    "waist" DOUBLE PRECISION,
    "hips" DOUBLE PRECISION,
    "leftArm30Pct" DOUBLE PRECISION,
    "leftArm50Pct" DOUBLE PRECISION,
    "leftArm70Pct" DOUBLE PRECISION,
    "leftDelt" DOUBLE PRECISION,
    "leftForearm" DOUBLE PRECISION,
    "leftWrist" DOUBLE PRECISION,
    "leftCalf30Pct" DOUBLE PRECISION,
    "leftCalf70Pct" DOUBLE PRECISION,
    "leftThigh150Pct" DOUBLE PRECISION,
    "leftThigh30Pct" DOUBLE PRECISION,
    "leftThigh50Pct" DOUBLE PRECISION,
    "leftThigh75Pct" DOUBLE PRECISION,
    "leftThigh90Pct" DOUBLE PRECISION,
    "rightArm30Pct" DOUBLE PRECISION,
    "rightArm50Pct" DOUBLE PRECISION,
    "rightArm70Pct" DOUBLE PRECISION,
    "rightDelt" DOUBLE PRECISION,
    "rightForearm" DOUBLE PRECISION,
    "rightWrist" DOUBLE PRECISION,
    "rightCalf30Pct" DOUBLE PRECISION,
    "rightCalf70Pct" DOUBLE PRECISION,
    "rightThigh150Pct" DOUBLE PRECISION,
    "rightThigh30Pct" DOUBLE PRECISION,
    "rightThigh50Pct" DOUBLE PRECISION,
    "rightThigh75Pct" DOUBLE PRECISION,
    "rightThigh90Pct" DOUBLE PRECISION,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "BodyMeasurement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "nickname" TEXT,
    "age" DOUBLE PRECISION,
    "sex" "Sex" NOT NULL,
    "isPregnant" BOOLEAN,
    "isLactating" BOOLEAN,
    "targetWeight" DOUBLE PRECISION,
    "profilePicUrl" TEXT,
    "scheduleId" TEXT,
    "primaryGoal" "TrainingGoal",
    "secondaryGoal" "TrainingGoal",
    "riskTolerance" "RiskTolerance",
    "dietaryPattern" "DietaryPattern" DEFAULT 'OMNIVORE',
    "generalStimulantSensitivity" "SensitivityLevel" DEFAULT 'NORMAL',
    "occupationalActivity" "OccupationalActivity",
    "lastActiveAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NutritionTarget" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "proteinMinG" DOUBLE PRECISION,
    "proteinMaxG" DOUBLE PRECISION,
    "carbsMinG" DOUBLE PRECISION,
    "carbsMaxG" DOUBLE PRECISION,
    "fatMinG" DOUBLE PRECISION,
    "fatMaxG" DOUBLE PRECISION,
    "kcalMin" DOUBLE PRECISION,
    "kcalMax" DOUBLE PRECISION,
    "waterTrainingL" DOUBLE PRECISION,
    "waterRestL" DOUBLE PRECISION,
    "fructoseMaxG" DOUBLE PRECISION,
    "saltMaxG" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "NutritionTarget_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserSupplement" (
    "id" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "dailyDose" DOUBLE PRECISION,
    "dailyCapsules" INTEGER,
    "weeklyFrequency" "WeeklyFrequency",
    "dayTiming" "DayTiming"[],
    "containerSize" DOUBLE PRECISION,
    "containerUnit" "QuantityUnit",
    "remainingQuantity" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "UserSupplement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserMedicalCondition" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "medicalConditionId" INTEGER NOT NULL,
    "diagnosedDate" TIMESTAMP(3),
    "severity" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserMedicalCondition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserMedication" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "medicationId" INTEGER NOT NULL,
    "dosage" DOUBLE PRECISION,
    "dayTiming" "DayTiming"[],
    "weeklyFrequency" "WeeklyFrequency" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserMedication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserAllergy" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "allergenId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserAllergy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserSupplementSensitivity" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "level" "SensitivityLevel" NOT NULL,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "UserSupplementSensitivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserSupplementPreference" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "supplementTypeId" INTEGER NOT NULL,
    "direction" "PreferenceDirection" NOT NULL,
    "reason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "UserSupplementPreference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TipSuggestion" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "category" "TipCategory" NOT NULL DEFAULT 'NO_CATEGORY',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "TipSuggestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ExerciseDayToTipSuggestion" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ExerciseDayToTipSuggestion_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ExerciseDayTemplateToMesocycleTemplate" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ExerciseDayTemplateToMesocycleTemplate_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "UserConsent_userId_consentType_idx" ON "UserConsent"("userId", "consentType");

-- CreateIndex
CREATE INDEX "DataErasureRequest_userId_idx" ON "DataErasureRequest"("userId");

-- CreateIndex
CREATE INDEX "AIUsageLog_userId_feature_idx" ON "AIUsageLog"("userId", "feature");

-- CreateIndex
CREATE INDEX "Exercise_exerciseDayId_idx" ON "Exercise"("exerciseDayId");

-- CreateIndex
CREATE INDEX "Exercise_exerciseTemplateId_idx" ON "Exercise"("exerciseTemplateId");

-- CreateIndex
CREATE INDEX "Exercise_gripId_idx" ON "Exercise"("gripId");

-- CreateIndex
CREATE UNIQUE INDEX "Exercise_exerciseDayId_dayPosition_key" ON "Exercise"("exerciseDayId", "dayPosition");

-- CreateIndex
CREATE INDEX "UserEquipment_equipmentId_idx" ON "UserEquipment"("equipmentId");

-- CreateIndex
CREATE INDEX "SetSpec_exerciseId_idx" ON "SetSpec"("exerciseId");

-- CreateIndex
CREATE UNIQUE INDEX "Grip_type_key" ON "Grip"("type");

-- CreateIndex
CREATE UNIQUE INDEX "Equipment_name_key" ON "Equipment"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ExerciseType_name_key" ON "ExerciseType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CommonAngle_degree_key" ON "CommonAngle"("degree");

-- CreateIndex
CREATE UNIQUE INDEX "Rep_range_key" ON "Rep"("range");

-- CreateIndex
CREATE INDEX "Image_exerciseTypeId_role_idx" ON "Image"("exerciseTypeId", "role");

-- CreateIndex
CREATE INDEX "Image_muscleId_idx" ON "Image"("muscleId");

-- CreateIndex
CREATE INDEX "Image_userId_idx" ON "Image"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Muscle_name_key" ON "Muscle"("name");

-- CreateIndex
CREATE INDEX "Muscle_parentId_idx" ON "Muscle"("parentId");

-- CreateIndex
CREATE UNIQUE INDEX "Movement_name_key" ON "Movement"("name");

-- CreateIndex
CREATE INDEX "MuscleMovement_movementId_idx" ON "MuscleMovement"("movementId");

-- CreateIndex
CREATE UNIQUE INDEX "MuscleEndRegion_name_key" ON "MuscleEndRegion"("name");

-- CreateIndex
CREATE INDEX "ExerciseTypeMuscle_muscleId_idx" ON "ExerciseTypeMuscle"("muscleId");

-- CreateIndex
CREATE UNIQUE INDEX "Schedule_userId_key" ON "Schedule"("userId");

-- CreateIndex
CREATE INDEX "Schedule_userId_idx" ON "Schedule"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "SupplementType_name_key" ON "SupplementType"("name");

-- CreateIndex
CREATE INDEX "SupplementDoseRange_supplementTypeId_medicalConditionId_idx" ON "SupplementDoseRange"("supplementTypeId", "medicalConditionId");

-- CreateIndex
CREATE INDEX "SupplementCoFactor_supplementBId_idx" ON "SupplementCoFactor"("supplementBId");

-- CreateIndex
CREATE INDEX "SupplementClash_supplementBId_idx" ON "SupplementClash"("supplementBId");

-- CreateIndex
CREATE UNIQUE INDEX "SupplementClash_supplementAId_supplementBId_medicalConditio_key" ON "SupplementClash"("supplementAId", "supplementBId", "medicalConditionId");

-- CreateIndex
CREATE UNIQUE INDEX "MedicalCondition_name_key" ON "MedicalCondition"("name");

-- CreateIndex
CREATE INDEX "SupplementMedicalConditionClash_medicalConditionId_idx" ON "SupplementMedicalConditionClash"("medicalConditionId");

-- CreateIndex
CREATE UNIQUE INDEX "SupplementMedicalConditionClash_supplementTypeId_medicalCon_key" ON "SupplementMedicalConditionClash"("supplementTypeId", "medicalConditionId");

-- CreateIndex
CREATE UNIQUE INDEX "Medication_name_key" ON "Medication"("name");

-- CreateIndex
CREATE INDEX "SupplementMedicationClash_medicationId_idx" ON "SupplementMedicationClash"("medicationId");

-- CreateIndex
CREATE UNIQUE INDEX "SupplementMedicationClash_supplementTypeId_medicationId_key" ON "SupplementMedicationClash"("supplementTypeId", "medicationId");

-- CreateIndex
CREATE UNIQUE INDEX "Allergen_name_key" ON "Allergen"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Hormone_name_key" ON "Hormone"("name");

-- CreateIndex
CREATE INDEX "SupplementHormonalEffect_hormoneId_idx" ON "SupplementHormonalEffect"("hormoneId");

-- CreateIndex
CREATE UNIQUE INDEX "SupplementHormonalEffect_supplementTypeId_hormoneId_key" ON "SupplementHormonalEffect"("supplementTypeId", "hormoneId");

-- CreateIndex
CREATE UNIQUE INDEX "Food_name_key" ON "Food"("name");

-- CreateIndex
CREATE INDEX "SupplementFoodInteraction_foodId_idx" ON "SupplementFoodInteraction"("foodId");

-- CreateIndex
CREATE INDEX "SupplementFoodInteraction_supplementTypeId_mealType_idx" ON "SupplementFoodInteraction"("supplementTypeId", "mealType");

-- CreateIndex
CREATE INDEX "SupplementUsageTip_supplementTypeId_idx" ON "SupplementUsageTip"("supplementTypeId");

-- CreateIndex
CREATE INDEX "SupplementDose_userSupplementId_scheduledDate_idx" ON "SupplementDose"("userSupplementId", "scheduledDate");

-- CreateIndex
CREATE INDEX "SupplementDose_scheduledDate_idx" ON "SupplementDose"("scheduledDate");

-- CreateIndex
CREATE INDEX "SupplementProtocolPhase_userSupplementId_phaseOrder_idx" ON "SupplementProtocolPhase"("userSupplementId", "phaseOrder");

-- CreateIndex
CREATE INDEX "SetSpecTemplate_exerciseTemplateId_idx" ON "SetSpecTemplate"("exerciseTemplateId");

-- CreateIndex
CREATE INDEX "ExerciseTemplate_typeId_idx" ON "ExerciseTemplate"("typeId");

-- CreateIndex
CREATE INDEX "ExerciseTemplate_gripId_idx" ON "ExerciseTemplate"("gripId");

-- CreateIndex
CREATE INDEX "ExerciseTemplate_createdBy_idx" ON "ExerciseTemplate"("createdBy");

-- CreateIndex
CREATE INDEX "ProgressSnapshot_userId_weekStart_idx" ON "ProgressSnapshot"("userId", "weekStart");

-- CreateIndex
CREATE UNIQUE INDEX "ProgressSnapshot_userId_weekStart_key" ON "ProgressSnapshot"("userId", "weekStart");

-- CreateIndex
CREATE INDEX "ExerciseTypeFrequency_userId_mesocycleId_idx" ON "ExerciseTypeFrequency"("userId", "mesocycleId");

-- CreateIndex
CREATE UNIQUE INDEX "ExerciseTypeFrequency_userId_exerciseTypeId_mesocycleId_wee_key" ON "ExerciseTypeFrequency"("userId", "exerciseTypeId", "mesocycleId", "weekNumber");

-- CreateIndex
CREATE INDEX "ProgressionEvent_userId_exerciseTypeId_idx" ON "ProgressionEvent"("userId", "exerciseTypeId");

-- CreateIndex
CREATE INDEX "ProgressionEvent_occurredAt_idx" ON "ProgressionEvent"("occurredAt");

-- CreateIndex
CREATE UNIQUE INDEX "UserStats_userId_key" ON "UserStats"("userId");

-- CreateIndex
CREATE INDEX "PersonalRecord_userId_exerciseTypeId_idx" ON "PersonalRecord"("userId", "exerciseTypeId");

-- CreateIndex
CREATE INDEX "PersonalRecord_achievedAt_idx" ON "PersonalRecord"("achievedAt");

-- CreateIndex
CREATE INDEX "BodyMeasurement_userId_measuredAt_idx" ON "BodyMeasurement"("userId", "measuredAt");

-- CreateIndex
CREATE INDEX "BodyMeasurement_exerciseDayId_idx" ON "BodyMeasurement"("exerciseDayId");

-- CreateIndex
CREATE INDEX "BodyMeasurement_userId_context_idx" ON "BodyMeasurement"("userId", "context");

-- CreateIndex
CREATE UNIQUE INDEX "NutritionTarget_userId_key" ON "NutritionTarget"("userId");

-- CreateIndex
CREATE INDEX "UserSupplement_supplementTypeId_userId_idx" ON "UserSupplement"("supplementTypeId", "userId");

-- CreateIndex
CREATE INDEX "UserMedicalCondition_medicalConditionId_idx" ON "UserMedicalCondition"("medicalConditionId");

-- CreateIndex
CREATE UNIQUE INDEX "UserMedicalCondition_userId_medicalConditionId_key" ON "UserMedicalCondition"("userId", "medicalConditionId");

-- CreateIndex
CREATE INDEX "UserMedication_medicationId_idx" ON "UserMedication"("medicationId");

-- CreateIndex
CREATE UNIQUE INDEX "UserMedication_userId_medicationId_key" ON "UserMedication"("userId", "medicationId");

-- CreateIndex
CREATE UNIQUE INDEX "UserAllergy_userId_allergenId_key" ON "UserAllergy"("userId", "allergenId");

-- CreateIndex
CREATE UNIQUE INDEX "UserSupplementSensitivity_userId_supplementTypeId_key" ON "UserSupplementSensitivity"("userId", "supplementTypeId");

-- CreateIndex
CREATE UNIQUE INDEX "UserSupplementPreference_userId_supplementTypeId_key" ON "UserSupplementPreference"("userId", "supplementTypeId");

-- CreateIndex
CREATE INDEX "_ExerciseDayToTipSuggestion_B_index" ON "_ExerciseDayToTipSuggestion"("B");

-- CreateIndex
CREATE INDEX "_ExerciseDayTemplateToMesocycleTemplate_B_index" ON "_ExerciseDayTemplateToMesocycleTemplate"("B");

-- AddForeignKey
ALTER TABLE "UserConsent" ADD CONSTRAINT "UserConsent_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DataErasureRequest" ADD CONSTRAINT "DataErasureRequest_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AIUsageLog" ADD CONSTRAINT "AIUsageLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercise" ADD CONSTRAINT "Exercise_exerciseDayId_fkey" FOREIGN KEY ("exerciseDayId") REFERENCES "ExerciseDay"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercise" ADD CONSTRAINT "Exercise_gripId_fkey" FOREIGN KEY ("gripId") REFERENCES "Grip"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercise" ADD CONSTRAINT "Exercise_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEquipment" ADD CONSTRAINT "UserEquipment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEquipment" ADD CONSTRAINT "UserEquipment_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SetSpec" ADD CONSTRAINT "SetSpec_exerciseId_fkey" FOREIGN KEY ("exerciseId") REFERENCES "Exercise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_exerciseTypeId_fkey" FOREIGN KEY ("exerciseTypeId") REFERENCES "ExerciseType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_muscleId_fkey" FOREIGN KEY ("muscleId") REFERENCES "Muscle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_gripId_fkey" FOREIGN KEY ("gripId") REFERENCES "Grip"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Muscle" ADD CONSTRAINT "Muscle_originId_fkey" FOREIGN KEY ("originId") REFERENCES "MuscleEndRegion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Muscle" ADD CONSTRAINT "Muscle_insertionId_fkey" FOREIGN KEY ("insertionId") REFERENCES "MuscleEndRegion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Muscle" ADD CONSTRAINT "Muscle_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Muscle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MuscleMovement" ADD CONSTRAINT "MuscleMovement_muscleId_fkey" FOREIGN KEY ("muscleId") REFERENCES "Muscle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MuscleMovement" ADD CONSTRAINT "MuscleMovement_movementId_fkey" FOREIGN KEY ("movementId") REFERENCES "Movement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTypeMuscle" ADD CONSTRAINT "ExerciseTypeMuscle_exerciseTypeId_fkey" FOREIGN KEY ("exerciseTypeId") REFERENCES "ExerciseType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTypeMuscle" ADD CONSTRAINT "ExerciseTypeMuscle_muscleId_fkey" FOREIGN KEY ("muscleId") REFERENCES "Muscle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseDay" ADD CONSTRAINT "ExerciseDay_mesoId_fkey" FOREIGN KEY ("mesoId") REFERENCES "Mesocycle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Mesocycle" ADD CONSTRAINT "Mesocycle_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES "Schedule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementDoseRange" ADD CONSTRAINT "SupplementDoseRange_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementDoseRange" ADD CONSTRAINT "SupplementDoseRange_medicalConditionId_fkey" FOREIGN KEY ("medicalConditionId") REFERENCES "MedicalCondition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementCoFactor" ADD CONSTRAINT "SupplementCoFactor_supplementAId_fkey" FOREIGN KEY ("supplementAId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementCoFactor" ADD CONSTRAINT "SupplementCoFactor_supplementBId_fkey" FOREIGN KEY ("supplementBId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementClash" ADD CONSTRAINT "SupplementClash_supplementAId_fkey" FOREIGN KEY ("supplementAId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementClash" ADD CONSTRAINT "SupplementClash_supplementBId_fkey" FOREIGN KEY ("supplementBId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementClash" ADD CONSTRAINT "SupplementClash_medicalConditionId_fkey" FOREIGN KEY ("medicalConditionId") REFERENCES "MedicalCondition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementMedicalConditionClash" ADD CONSTRAINT "SupplementMedicalConditionClash_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementMedicalConditionClash" ADD CONSTRAINT "SupplementMedicalConditionClash_medicalConditionId_fkey" FOREIGN KEY ("medicalConditionId") REFERENCES "MedicalCondition"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementMedicationClash" ADD CONSTRAINT "SupplementMedicationClash_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementMedicationClash" ADD CONSTRAINT "SupplementMedicationClash_medicationId_fkey" FOREIGN KEY ("medicationId") REFERENCES "Medication"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementAllergen" ADD CONSTRAINT "SupplementAllergen_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementAllergen" ADD CONSTRAINT "SupplementAllergen_allergenId_fkey" FOREIGN KEY ("allergenId") REFERENCES "Allergen"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementHormonalEffect" ADD CONSTRAINT "SupplementHormonalEffect_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementHormonalEffect" ADD CONSTRAINT "SupplementHormonalEffect_hormoneId_fkey" FOREIGN KEY ("hormoneId") REFERENCES "Hormone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementFoodInteraction" ADD CONSTRAINT "SupplementFoodInteraction_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementFoodInteraction" ADD CONSTRAINT "SupplementFoodInteraction_foodId_fkey" FOREIGN KEY ("foodId") REFERENCES "Food"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementUsageTip" ADD CONSTRAINT "SupplementUsageTip_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementDose" ADD CONSTRAINT "SupplementDose_userSupplementId_fkey" FOREIGN KEY ("userSupplementId") REFERENCES "UserSupplement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplementProtocolPhase" ADD CONSTRAINT "SupplementProtocolPhase_userSupplementId_fkey" FOREIGN KEY ("userSupplementId") REFERENCES "UserSupplement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SetSpecTemplate" ADD CONSTRAINT "SetSpecTemplate_exerciseTemplateId_fkey" FOREIGN KEY ("exerciseTemplateId") REFERENCES "ExerciseTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTemplate" ADD CONSTRAINT "ExerciseTemplate_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ExerciseType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTemplate" ADD CONSTRAINT "ExerciseTemplate_gripId_fkey" FOREIGN KEY ("gripId") REFERENCES "Grip"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTemplate" ADD CONSTRAINT "ExerciseTemplate_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MesocycleTemplate" ADD CONSTRAINT "MesocycleTemplate_scheduleTemplateId_fkey" FOREIGN KEY ("scheduleTemplateId") REFERENCES "ScheduleTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProgressSnapshot" ADD CONSTRAINT "ProgressSnapshot_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTypeFrequency" ADD CONSTRAINT "ExerciseTypeFrequency_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTypeFrequency" ADD CONSTRAINT "ExerciseTypeFrequency_exerciseTypeId_fkey" FOREIGN KEY ("exerciseTypeId") REFERENCES "ExerciseType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExerciseTypeFrequency" ADD CONSTRAINT "ExerciseTypeFrequency_mesocycleId_fkey" FOREIGN KEY ("mesocycleId") REFERENCES "Mesocycle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProgressionEvent" ADD CONSTRAINT "ProgressionEvent_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProgressionEvent" ADD CONSTRAINT "ProgressionEvent_exerciseTypeId_fkey" FOREIGN KEY ("exerciseTypeId") REFERENCES "ExerciseType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserStats" ADD CONSTRAINT "UserStats_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PersonalRecord" ADD CONSTRAINT "PersonalRecord_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PersonalRecord" ADD CONSTRAINT "PersonalRecord_exerciseTypeId_fkey" FOREIGN KEY ("exerciseTypeId") REFERENCES "ExerciseType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PersonalRecord" ADD CONSTRAINT "PersonalRecord_setSpecId_fkey" FOREIGN KEY ("setSpecId") REFERENCES "SetSpec"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BodyMeasurement" ADD CONSTRAINT "BodyMeasurement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BodyMeasurement" ADD CONSTRAINT "BodyMeasurement_exerciseDayId_fkey" FOREIGN KEY ("exerciseDayId") REFERENCES "ExerciseDay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NutritionTarget" ADD CONSTRAINT "NutritionTarget_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSupplement" ADD CONSTRAINT "UserSupplement_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSupplement" ADD CONSTRAINT "UserSupplement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserMedicalCondition" ADD CONSTRAINT "UserMedicalCondition_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserMedicalCondition" ADD CONSTRAINT "UserMedicalCondition_medicalConditionId_fkey" FOREIGN KEY ("medicalConditionId") REFERENCES "MedicalCondition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserMedication" ADD CONSTRAINT "UserMedication_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserMedication" ADD CONSTRAINT "UserMedication_medicationId_fkey" FOREIGN KEY ("medicationId") REFERENCES "Medication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserAllergy" ADD CONSTRAINT "UserAllergy_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserAllergy" ADD CONSTRAINT "UserAllergy_allergenId_fkey" FOREIGN KEY ("allergenId") REFERENCES "Allergen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSupplementSensitivity" ADD CONSTRAINT "UserSupplementSensitivity_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSupplementSensitivity" ADD CONSTRAINT "UserSupplementSensitivity_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSupplementPreference" ADD CONSTRAINT "UserSupplementPreference_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSupplementPreference" ADD CONSTRAINT "UserSupplementPreference_supplementTypeId_fkey" FOREIGN KEY ("supplementTypeId") REFERENCES "SupplementType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExerciseDayToTipSuggestion" ADD CONSTRAINT "_ExerciseDayToTipSuggestion_A_fkey" FOREIGN KEY ("A") REFERENCES "ExerciseDay"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExerciseDayToTipSuggestion" ADD CONSTRAINT "_ExerciseDayToTipSuggestion_B_fkey" FOREIGN KEY ("B") REFERENCES "TipSuggestion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExerciseDayTemplateToMesocycleTemplate" ADD CONSTRAINT "_ExerciseDayTemplateToMesocycleTemplate_A_fkey" FOREIGN KEY ("A") REFERENCES "ExerciseDayTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExerciseDayTemplateToMesocycleTemplate" ADD CONSTRAINT "_ExerciseDayTemplateToMesocycleTemplate_B_fkey" FOREIGN KEY ("B") REFERENCES "MesocycleTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;
