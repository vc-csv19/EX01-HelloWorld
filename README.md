# Exercise: HelloWorld 25 Points

The objective of this exercise is to familiarize yourself
with the programming environment, working with the QEMU emulator and
to familiarize yourself with your first assemply program. 

The first thing you will need to do is accept the invitation to this assignment from GitHub Classroom. You can click [here](https://classroom.github.com/a/SaTUhxBc) to accept the invitation, and then follow the instructions here to get started.

Be sure that you accept the invitation first and use the URL from the your new project when you clone it in CLion.

## About this Assignment

This exercise is different from others you have done before. You will start with C code, then generate assembly code and then make a small change to finish the assignment. 

Be sure to follow all directions and now that you are a more advanced programming student, be prepared to have to do some problem solving and critical thinking rather than just following directions.

### Starting the Arm Emulator

If you're on Windows, in the Configuration drop down, select `Start Arm Emulator (Windows 10)`, otherwise
select `Start Arm Emulator` and press the play button. This will start QEMU and create a host virtual machine running Ubuntu Linux for
Aarch64. It takes several minutes to boot up, but once it's done you should see the following line:

```bash
Last login: Sat Jan 25 13:04:19 PST 2020 from 10.0.2.2 on pts/0
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-72-generic aarch64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

vscilab@vc-csv19-dev:
```

Once you see this text in the Terminal tab at the bottom of CLion, then you can move on to the next step.

### Selecting the proper toolchain

This assignment is meant to work on an Arm processor using an Arm toolchain. To properly complete this assignment, complete 
the following steps:

1. Navigate to `File -> Settings` and then click the triangle next to `Build, Execution, Deployment` and select `Toolchain`.
   Under toolchain select `Docker Arm Host` and then press the up arrow at the top to move this tool chain to the very top 
   of the list, making it the default tool chain.
2. Press the `OK` button
3. Select the project name in the Project view and right click it. Then select `Reload CMake Project`

Once the CMake project is finished reload, which may take about a minute, then you are ready to go on to the next
steps of this assignment. Wait for this step to complete, and then move on to the next step.

### Running the code for this project

Running this code should be straightforward. In the drop-down 
menu in the upper right-hand corner you should see a *Run
Configuration* called `HelloWorld | Debug`. Make sure this 
configuration is selected and press the play button next to it.
In the **Run** view below the code you should see the output 
of running the program. It should look something like this:

```bash
/tmp/tmp.5rVvegi6jL/cmake-build-debug/HelloWorld
Change this string!

Process finished with exit code 0
```
Success! Now you can move on to submitting your code. But notice it does not actually print `Hello, World!`. 
You will make the program do this in the assembly version in the next step.

#### Generating Assembly code from C code

Next you will generate the assembly code, for the Arm processor, from the original C code. 
This is done using a configuration named `Generate-Assembly`. To generator the assembly, in CLion
select the `Generate-Assembly` configuration at the top and press the hammer icon, not the
play icon. This action will generate the assembly code in the QEMU Arm guest system. Next, 
you will need to download the assembly file to the Windows (or Linux) host system. After the
`Generate-Assembly` target is finished, right-click on the `src` directory in the project view
and then select `Deployment -> Download from ...`. In the dialog the is shown select the top server
to download from and press the _Enter_ key. Select `Yes` for any questions that CLion asks about 
overwriting files. When operation finishes, there should be a new file called `src/main.s`. This
is the assembly file you will change to complete this assignment.

It is important that you complete this step while using CLion on the Remote Arm toolchain. If you 
do this on the Docker toolchain you will generate assembly code for the Intel processor. To tell if
you've done this step properly, the following is what is generated for Intel:

```asm
	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Hello, World!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
```

The above code will **NOT** work in the following steps.

Since for this class we are doing Arm assembly, this code will not work. Be sure to follow the steps above
to use the correct toolchain.

#### Updating the Assembly code

Next, you will update the assembly code so that it prints `Hello, World!` instead of `Change this string!`.
Open the file `main.s`, and on line 7, change `.string	"Change this string!"` to `.string	"Hello, World!"`.
Next, select the configuration `HelloWorld-From-Assembly`. Press the play button, and you should see the following
output: 

```bash
/tmp/tmp.5rVvegi6jL/cmake-build-debug/HelloWorld-From-Assembly
Hello, World!

Process finished with exit code 0
```

### Submitting the code for this project

First, right click on the project name, then select `Git -> Commit Directory...`. 
Make sure only the files you want to push are selected, `main.s`. Then uncheck `Perform code analysis` and `Check TODO`. It's OK to leave them checked, but committing will take longer. Leave `Run git hooks` unchecked as well. Put a message in `Commit Message`. Press the down arrow next to **Commit** and then select **Commit and Push** button. Once the commit is finished, press the **Push** button. If anything goes wrong check the _Version Control_ view
in the lower left corner and select the _Console_ tab.
 
If you forget to do the command and push at the same time, right click on the project name, then select `Git -> Repository -> Push...`. Follow the onscreen directions
and press **OK**. This step will then submit them to the cloud to have the tests run for grading.
