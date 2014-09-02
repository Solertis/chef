#
# Author:: Chris Doherty <cdoherty@getchef.com>)
# Copyright:: Copyright (c) 2014 Chef, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource'

class Chef
  class Resource
    class Reboot < Chef::Resource
      def initialize(name, run_context=nil)
        super
        @resource_name = :reboot
        @provider = Chef::Provider::Reboot
        @allowed_actions = [:request, :cancel]

        @reason = "Reboot by Chef"
        @timeout = 0

        # no default action just now.
      end

      def reason(arg=nil)
        set_or_return(:reason, arg, :kind_of => String)
      end

      def timeout(arg=nil)
        set_or_return(:timeout, arg, :kind_of => Fixnum)
      end

      def timestamp(arg=nil)
        set_or_return(:timestamp, arg, :kind_of => Time)
      end
    end
  end
end
