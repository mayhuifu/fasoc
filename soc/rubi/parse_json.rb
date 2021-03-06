# MIT License

# Copyright (c) 2018 The University of Michigan

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

def parse_json(infile, design, outfile_hier, outfile_conn)

infile = File.open(infile, 'r')
tmpfile = File.open(File.dirname(__FILE__) + "/tmp_resolved_design.json", 'w')

to_n = 0
infile.each_line { |line|
  if line =~ /\"to\"/
    tmpfile.write(line.gsub("\"to\"", "\"to_#{to_n}\""))
    to_n += 1
  else
    tmpfile.write(line)
  end
}
infile.close
tmpfile.close

read_json = File.read(File.dirname(__FILE__) + "/tmp_resolved_design.json")
outfile0 = File.open(outfile_hier, 'w')
outfile = File.open(outfile_conn, 'w')

my_hash = JSON.parse(read_json)
outfile0.write("load File.dirname(__FILE__) + \"/Define_SoCParameters.rb\"\n\n")
outfile0.write("require 'IPXACT2009API'\n\n")
outfile.write("load File.dirname(__FILE__) + \"/Define_SoCParameters.rb\"\n\n")
outfile.write("require 'IPXACT2009API'\n\n")
outfile.write("component = findComponent(:name => \"" +design+"\")\n\n")
outfile.write("loadBusDefinitions(:name => \"APB4\")\n\n")
outfile.write("loadBusDefinitions(:name => \"AHBLite\")\n\n")
top_name = design
outfile0.write("component = createComponent(:name => \"#{top_name}\")\n\n")

modules_array = my_hash['modules']
for mod in modules_array
  param_binding = ""
  for key in mod.keys
    if key == "module_name"
      comp_name = mod['module_name']
    elsif key == "generator"
      gen_name = mod['generator']
    elsif key == "instance_name"
      inst_name = mod['instance_name']
    elsif key == "parameters"
      param_ash = mod['parameters']
      param_binding = ", :parameter_binding => {"
      for param in param_ash.keys
        param_name = param
        param_value = param_ash[param]
        if param == param_ash.keys.first
          param_binding = param_binding + "\"#{param_name}\" => \"#{param_value}\""
            if param_ash.keys.count > 1
              param_binding = param_binding + ", "
            else
              param_binding = param_binding + "}"
            end
        elsif param == param_ash.keys.last
          param_binding = param_binding + "\"#{param_name}\" => \"#{param_value}\"}"
        else
          param_binding = param_binding + "\"#{param_name}\" => \"#{param_value}\", "
        end
      end
    end
  end
  if gen_name == "adc-gen"
    outfile0.write("if INCLUDE_ADCGEN == 1\n  ")
  elsif gen_name == "cdc-gen"
    outfile0.write("if INCLUDE_CDCGEN == 1\n  ")
  elsif gen_name == "dcdc-gen"
    outfile0.write("if INCLUDE_DCDCGEN == 1\n  ")
  elsif gen_name == "ldo-gen"
    outfile0.write("if INCLUDE_LDOGEN == 1\n  ")
  elsif gen_name == "memory-gen"
    outfile0.write("if INCLUDE_MEMGEN == 1\n  ")
  elsif gen_name == "pll-gen"
    outfile0.write("if INCLUDE_PLLGEN == 1\n  ")
  elsif gen_name == "temp-sense-gen"
    outfile0.write("if INCLUDE_TEMPGEN == 1\n  ")
  end
  outfile0.write("createComponentInstance(component, :instance_name => \"#{inst_name}\", :name => \"#{comp_name}\"#{param_binding})\n")
  if gen_name == "adc-gen" or gen_name == "cdc-gen" or gen_name == "dcdc-gen" or gen_name == "ldo-gen" \
    or gen_name == "memory-gen" or gen_name == "pll-gen" or gen_name == "temp-sense-gen"
    outfile0.write("end\n\n")
  else
    outfile0.write("\n")
  end
end
conn_array = my_hash['connections']
for conn in conn_array
  to_insts = Array.new
  to_ports = Array.new
  to_index = 0
  conn_type = ""
  from_inst = ""
  from_port = ""
  from_range_def = "false"
  to_range_def = Array.new
  from_range = ""
  from_msb = ""
  from_lsb = ""
  to_range = Array.new
  to_msb = Array.new
  to_lsb = Array.new
  value = ""
  for key in conn.keys
    if key == "type"
      type = conn['type']
    elsif key == "from"
      from_inst = conn['from']['instance']
      from_port = conn['from']['port']
      if conn['from']['range']
        from_range_def = "true"
        from_msb = conn['from']['range']['max']
        from_lsb = conn['from']['range']['min']
      end
      if conn['from']['value']
        value = conn['from']['value']
      end
    elsif key =~ /to_[0-9]+/
      for i in 0..(conn[key].length-1)
        to_insts[to_index] = conn[key][i]['instance']
        to_ports[to_index] = conn[key][i]['port']
        to_range_def[to_index] = "false"
        if conn[key][i]['range']
          to_range_def[to_index] = "true"
          to_msb[i] = conn[key][i]['range']['max']
          to_lsb[i] = conn[key][i]['range']['min']
        end
        to_index += 1
      end
    end
  end
  if type == "ahb"
    outfile.write("connect(component, :instance1 => \"#{from_inst}\", :interface1 => \"#{from_port}\",\n")
    outfile.write("                   :instance2 => \"#{to_insts[0]}\", :interface2 => \"#{to_ports[0]}\",\n")
    outfile.write("                   :exclude_logical_ports1 => \"HSELx,HREADYOUT,HCLK,HRESETn\",\n")
    outfile.write("                   :check_direct_connection => false)\n")
  elsif type == "apb"
      outfile.write("connect(component, :instance1 => \"#{from_inst}\", :interface1 => \"#{from_port}\",\n")
      outfile.write("                   :instance2 => \"#{to_insts[0]}\", :interface2 => \"#{to_ports[0]}\",\n")
      outfile.write("                   :exclude_logical_ports1 => \"PCLK|PRESETn\")\n")
  elsif type == "tieoff"
    for i in 0..(to_index-1)
      outfile.write("tieOff(component, :instance => \"#{to_insts[i]}\", :port => \"#{to_ports[i]}\",\n")
      outfile.write("                  :value => \"#{value}\")\n")
    end
  else
    for i in 0..(to_index-1)
      if from_range_def == "true"
        from_range = "[#{from_msb}:#{from_lsb}]"
      else
        from_range = ""
      end
      if to_range_def[i] == "true"
        to_range = "[#{to_msb[i]}:#{to_lsb[i]}]"
      else
        to_range = ""
      end
      if from_inst == "toplevel"
        outfile.write("export(component, :instance => \"#{to_insts[i]}\", :port => \"#{to_ports[i]}#{to_range}\",\n")
        outfile.write(":exported_port_name => \"#{from_port}\")\n")
      elsif to_insts[i] == "toplevel"
        outfile.write("export(component, :instance => \"#{from_inst}\", :port => \"#{from_port}#{from_range}\",\n")
        outfile.write(":exported_port_name => \"#{to_ports[i]}\")\n")
      else
        outfile.write("connect(component, :instance1 => \"#{from_inst}\", :port1 => \"#{from_port}#{from_range}\",\n")
        outfile.write("                   :instance2 => \"#{to_insts[i]}\", :port2 => \"#{to_ports[i]}#{to_range}\")\n")
      end
    end
  end
end

outfile0.write("\nsaveDesignElement(component, :force_overwrite => true)\n")
outfile.write("tieOff(component, :instance => \".*\", :port => \".*\", :direction => :in,\n")
outfile.write("                  :value => \"0\")\n")
outfile.write("tieOff(component, :instance => \".*\", :port => \".*\", :direction => :out,\n")
outfile.write("                  :value => \"open\")\n")
outfile.write("\nsaveDesignElement(component, :force_overwrite => true)\n")

tmpfilename = File.dirname(__FILE__) + "/tmp_resolved_design.json"
system("rm '#{tmpfilename}'")
outfile0.close
outfile.close
end