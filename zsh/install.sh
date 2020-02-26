ZSHRC_FOLDER=$(dirname $(readlink -f $0));

ZSHRC_FILENAME=$ZSHRC_FOLDER/zshrc.symlink;

rm -rf $ZSHRC_FILENAME;

touch $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### FPATH.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/fpath.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### FUNCTIONS.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/functions.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### WINDOW.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/window.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### PROMPT.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/prompt.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### COMPLETION.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/completion.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### ALIASES.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/aliases.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### CONFIG.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
cat $ZSHRC_FOLDER/config.zsh >> $ZSHRC_FILENAME
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "" >> $ZSHRC_FILENAME;

echo "###~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
echo "### COMMENT.ZSH FILE ###" >> $ZSHRC_FILENAME;
echo "###~~~~~~~~~~~~~~~~~~###" >> $ZSHRC_FILENAME;
while IFS="" read -r p || [ -n "$p" ]
do
      printf '### %s\n' "$p" >> $ZSHRC_FILENAME;
done < $ZSHRC_FOLDER/comment.zsh
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;
echo "# EOF #" >> $ZSHRC_FILENAME;
echo "#~~~~~~~~~~~~~~~~~~~~" >> $ZSHRC_FILENAME;

ln -s $ZSHRC_FILENAME ~/.zshrc
