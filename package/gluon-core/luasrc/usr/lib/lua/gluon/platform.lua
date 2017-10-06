local platform_info = require 'platform_info'
local pairs = pairs

local setmetatable = setmetatable


module 'gluon.platform'

setmetatable(_M,
	     {
		__index = platform_info,
	     }
)

local function contains(table, value)
   for k, v in pairs(table) do
      if value == v then
         return k
      end
   end
   return false
end


function match(target, subtarget, boards)
   if get_target() ~= target then
      return false
   end

   if get_subtarget() ~= subtarget then
      return false
   end

   if boards and not contains(boards, get_board_name()) then
      return false
   end

   return true
end
