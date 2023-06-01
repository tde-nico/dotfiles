#!/usr/bin/env python3

from pwn import *

p64 = lambda x: util.packing.p64(x, endian='little')
u64 = lambda x: util.packing.u64(x, endian='little')
p32 = lambda x: util.packing.p32(x, endian='little')
u32 = lambda x: util.packing.u32(x, endian='little')

{bindings}

context.binary = {bin_name}
context.terminal = ['tmux', 'splitw', '-h', '-F' '#{{pane_pid}}', '-P']


def conn():
	if args.LOCAL:
		r = process({proc_args})
	elif args.REMOTE:
		r = remote("addr", 8000)
	else:
		r = gdb.debug({proc_args})
	return r


def main():
	r = conn()

	offset = 0

	payload = b''.join([
		b'A' * offset,
		cyclic(0),
	])

	prompt = r.recvuntil(b'')
	print(prompt)
	r.sendline(payload)

	r.interactive()


if __name__ == "__main__":
	main()
