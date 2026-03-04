module SchedulerADT
  ( Event (..),
    Scheduler,
    emptyScheduler,
    scheduleEvent,
    cancelEvent,
    getUpcomingEvents,
  )
where

-- Public Event type
data Event = Event
  { timestamp :: Int,
    description :: String
  }
  deriving (Eq, Show)

-- Internal representation (hidden)
newtype Scheduler = Scheduler [Event]

-- Create empty scheduler
emptyScheduler :: Scheduler
emptyScheduler = Scheduler []

-- Schedule an event (keeps events sorted by timestamp)
scheduleEvent :: Event -> Scheduler -> Scheduler
scheduleEvent e (Scheduler events) =
  Scheduler (insertSorted e events)

-- Cancel an event
cancelEvent :: Event -> Scheduler -> Scheduler
cancelEvent e (Scheduler events) =
  Scheduler (filter (/= e) events)

-- Get upcoming events (already sorted)
getUpcomingEvents :: Scheduler -> [Event]
getUpcomingEvents (Scheduler events) = events

-- Helper: insert while maintaining sorted order
insertSorted :: Event -> [Event] -> [Event]
insertSorted e [] = [e]
insertSorted e (x : xs)
  | timestamp e <= timestamp x = e : x : xs
  | otherwise = x : insertSorted e xs