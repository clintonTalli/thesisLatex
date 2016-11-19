gfxDirectory = '../gfx'
fileType = 'pdf'
import os
pdfGfx = [gfx for gfx in os.listdir(gfxDirectory) if gfx.endswith(fileType)]
with open('output.tex', 'w') as outputFileObject:
    for gfx in pdfGfx:
        frameTxt = '\\begin{frame} \\frametitle{%s}\n' % gfx
        frameTxt += '    \\begin{columns}[c]\n'
        frameTxt += '    \\column{.5\\textwidth}\n'
        frameTxt += '        \\begin{itemize}\n'
        frameTxt += '            \item[*] item 1\n'
        frameTxt += '            \item[*] item 2\n'
        frameTxt += '        \end{itemize}\n'
        frameTxt += '    \column{.5\\textwidth}\n'
        frameTxt += '        \\begin{minipage}{\linewidth}\n'
        frameTxt += '            \\begin{center}\n'
        frameTxt += '            \includegraphics[width=.9\\textwidth]{graphics/%s}\n' % gfx
        frameTxt += '            \captionof{figure}{Caption Text}\label{gfx:%s}\n' % gfx
        frameTxt += '            \end{center}\n'
        frameTxt += '        \end{minipage}\n'
        frameTxt += '    \end{columns}\n'
        frameTxt += '\end{frame}\n'
        outputFileObject.write(frameTxt)

