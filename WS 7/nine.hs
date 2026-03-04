import SchedulerADT

main :: IO ()
main = do
  let s0 = emptyScheduler

  let e1 = Event 10 "Team Meeting"
  let e2 = Event 5 "Morning Workout"
  let e3 = Event 20 "Project Deadline"

  let s1 = scheduleEvent e1 s0
  let s2 = scheduleEvent e2 s1
  let s3 = scheduleEvent e3 s2

  putStrLn "Upcoming Events:"
  mapM_ print (getUpcomingEvents s3)

  let s4 = cancelEvent e2 s3

  putStrLn "\nAfter Cancellation:"
  mapM_ print (getUpcomingEvents s4)