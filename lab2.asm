# lab2.s
# Angelina Castillo
# Prompts user for number of votes gained or lost based on each prompt
# reveals total difference of votes at the end of program

	.intel_syntax noprefix
	.data

LawnSignPrompt:
	        .ascii  "Votes gained from lawn signs.\n\0"
LawnVotes:
	.quad 0


MailerPrompt:
	.ascii "Votes gained from mailers.\n\0"
MailerVotes:
	.quad 0

AttackAdPrompt:
	.ascii "Votes lost from the other candidate's attack ads.\n\0"
AttackAdVotes:
	.quad 0

DebatePrompt:
	.ascii "Votes lost from the debate.\n\0"
DebateVotes:
	.quad 0

TotalPrompt:
	.ascii "The net change in votes is \0"

NewLine:
	.ascii "\n\0"
	
	.text
	.global _start

	
_start:
	lea rbx, LawnSignPrompt
	call PrintCString

	call ScanInt
	movq LawnVotes,	rbx

	lea rbx, MailerPrompt
	call PrintCString

	call ScanInt
	movq MailerVotes, rbx

        movq rax, LawnVotes
	add rax, MailerVotes	#add together lawn votes and mailer votes into rax
      
	lea rbx, AttackAdPrompt
	call PrintCString

	call ScanInt
	movq AttackAdVotes, rbx

	sub rax, AttackAdVotes
	
	lea rbx, DebatePrompt
	call PrintCString

	call ScanInt
	movq DebateVotes, rbx

	lea rbx, TotalPrompt
	call PrintCString

	sub rax, DebateVotes

	mov rbx, rax
        call PrintInt

	lea rbx, NewLine
	call PrintCString
	
        call EndProgram
	
