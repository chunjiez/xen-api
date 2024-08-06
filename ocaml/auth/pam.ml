(*
 * Copyright (C) 2006-2009 Citrix Systems Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 only. with the special
 * exception on linking described in file LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *)

external authenticate : string -> string -> unit = "stub_XA_mh_authorize"

external change_password : string -> string -> unit = "stub_XA_mh_chpasswd"

include (
  struct
    external unsafe_crypt_r : key:string -> setting:string -> string option
      = "stub_XA_crypt_r"
  end :
    sig
      val unsafe_crypt_r : key:string -> setting:string -> string option
      [@@alert unsafe "Direct usage of this function is not recommended."]
    end
)
