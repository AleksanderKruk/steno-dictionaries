# Generated from ./PloverDictionary.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .PloverDictionaryParser import PloverDictionaryParser
else:
    from PloverDictionaryParser import PloverDictionaryParser

# This class defines a complete generic visitor for a parse tree produced by PloverDictionaryParser.

class PloverDictionaryVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by PloverDictionaryParser#dictionary.
    def visitDictionary(self, ctx:PloverDictionaryParser.DictionaryContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#record.
    def visitRecord(self, ctx:PloverDictionaryParser.RecordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#translation.
    def visitTranslation(self, ctx:PloverDictionaryParser.TranslationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#command.
    def visitCommand(self, ctx:PloverDictionaryParser.CommandContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#combo.
    def visitCombo(self, ctx:PloverDictionaryParser.ComboContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#key.
    def visitKey(self, ctx:PloverDictionaryParser.KeyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#normalKey.
    def visitNormalKey(self, ctx:PloverDictionaryParser.NormalKeyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#modifierKey.
    def visitModifierKey(self, ctx:PloverDictionaryParser.ModifierKeyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#suffix.
    def visitSuffix(self, ctx:PloverDictionaryParser.SuffixContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#prefix.
    def visitPrefix(self, ctx:PloverDictionaryParser.PrefixContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#infix.
    def visitInfix(self, ctx:PloverDictionaryParser.InfixContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#glue.
    def visitGlue(self, ctx:PloverDictionaryParser.GlueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#retroInsertSpace.
    def visitRetroInsertSpace(self, ctx:PloverDictionaryParser.RetroInsertSpaceContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#retroDeleteSpace.
    def visitRetroDeleteSpace(self, ctx:PloverDictionaryParser.RetroDeleteSpaceContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#setSpace.
    def visitSetSpace(self, ctx:PloverDictionaryParser.SetSpaceContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#resetSpace.
    def visitResetSpace(self, ctx:PloverDictionaryParser.ResetSpaceContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#capFirstWord.
    def visitCapFirstWord(self, ctx:PloverDictionaryParser.CapFirstWordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#retroCapFirstWord.
    def visitRetroCapFirstWord(self, ctx:PloverDictionaryParser.RetroCapFirstWordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#lowerFirstChar.
    def visitLowerFirstChar(self, ctx:PloverDictionaryParser.LowerFirstCharContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#retroLowerFirstChar.
    def visitRetroLowerFirstChar(self, ctx:PloverDictionaryParser.RetroLowerFirstCharContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#upperFirstWord.
    def visitUpperFirstWord(self, ctx:PloverDictionaryParser.UpperFirstWordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#retroUpperFirstWord.
    def visitRetroUpperFirstWord(self, ctx:PloverDictionaryParser.RetroUpperFirstWordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#carryingCapitalization.
    def visitCarryingCapitalization(self, ctx:PloverDictionaryParser.CarryingCapitalizationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#casingModes.
    def visitCasingModes(self, ctx:PloverDictionaryParser.CasingModesContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#punctuation.
    def visitPunctuation(self, ctx:PloverDictionaryParser.PunctuationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#undo.
    def visitUndo(self, ctx:PloverDictionaryParser.UndoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#repeatLastStroke.
    def visitRepeatLastStroke(self, ctx:PloverDictionaryParser.RepeatLastStrokeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#retroToggleAsterisk.
    def visitRetroToggleAsterisk(self, ctx:PloverDictionaryParser.RetroToggleAsteriskContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#cancelFormatting.
    def visitCancelFormatting(self, ctx:PloverDictionaryParser.CancelFormattingContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#nothing.
    def visitNothing(self, ctx:PloverDictionaryParser.NothingContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#endWord.
    def visitEndWord(self, ctx:PloverDictionaryParser.EndWordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#currency.
    def visitCurrency(self, ctx:PloverDictionaryParser.CurrencyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#lookahead.
    def visitLookahead(self, ctx:PloverDictionaryParser.LookaheadContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#ploverCommand.
    def visitPloverCommand(self, ctx:PloverDictionaryParser.PloverCommandContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#meta.
    def visitMeta(self, ctx:PloverDictionaryParser.MetaContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#macro.
    def visitMacro(self, ctx:PloverDictionaryParser.MacroContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#pgh.
    def visitPgh(self, ctx:PloverDictionaryParser.PghContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#en.
    def visitEn(self, ctx:PloverDictionaryParser.EnContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#lpluscommand.
    def visitLpluscommand(self, ctx:PloverDictionaryParser.LpluscommandContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#lminuscommand.
    def visitLminuscommand(self, ctx:PloverDictionaryParser.LminuscommandContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#outline.
    def visitOutline(self, ctx:PloverDictionaryParser.OutlineContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#chord.
    def visitChord(self, ctx:PloverDictionaryParser.ChordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#unnumberedChord.
    def visitUnnumberedChord(self, ctx:PloverDictionaryParser.UnnumberedChordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#numberedChord.
    def visitNumberedChord(self, ctx:PloverDictionaryParser.NumberedChordContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#string.
    def visitString(self, ctx:PloverDictionaryParser.StringContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by PloverDictionaryParser#anychar.
    def visitAnychar(self, ctx:PloverDictionaryParser.AnycharContext):
        return self.visitChildren(ctx)



del PloverDictionaryParser