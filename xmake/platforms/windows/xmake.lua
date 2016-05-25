--!The Automatic Cross-platform Build Tool
-- 
-- XMake is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.
-- 
-- XMake is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public License
-- along with XMake; 
-- If not, see <a href="http://www.gnu.org/licenses/"> http://www.gnu.org/licenses/</a>
-- 
-- Copyright (C) 2015 - 2016, ruki All rights reserved.
--
-- @author      ruki
-- @file        xmake.lua
--

-- define platform
platform("windows")

    -- set os
    set_platform_os("windows")

    -- set hosts
    set_platform_hosts("windows")

    -- set archs
    set_platform_archs("x86", "x64", "amd64", "x86_amd64")

    -- set checker
    set_platform_checker("checker")

    -- set environment
    set_platform_environment("environment")

    -- on load
    on_platform_load(function ()

        -- imports
        import("core.project.config")
       
        -- init the file formats
        _g.formats          = {}
        _g.formats.static   = {"", ".lib"}
        _g.formats.object   = {"", ".obj"}
        _g.formats.shared   = {"", ".dll"}
        _g.formats.binary   = {"", ".exe"}

        -- init the toolchains
        _g.tools            = {}
        _g.tools.cc         = config.get("cc")
        _g.tools.cxx        = config.get("cxx")
        _g.tools.ld         = config.get("ld") 
        _g.tools.ar         = config.get("ar") 
        _g.tools.sh         = config.get("sh") 
        _g.tools.as         = config.get("as") 
        _g.tools.ex         = config.get("ex") 

    end)

    -- set menu
    set_platform_menu({
                        config = 
                        {   
                            {}   
                        ,   {nil, "vs", "kv", "auto", "The Microsoft Visual Studio"   }
                        }

                    ,   global = 
                        {   
                            {}
                        ,   {nil, "vs", "kv", "auto", "The Microsoft Visual Studio"   }
                        }
                    })

