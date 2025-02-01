# Generated from ./PloverDictionary.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .PloverDictionaryParser import PloverDictionaryParser
else:
    from PloverDictionaryParser import PloverDictionaryParser

# This class defines a complete listener for a parse tree produced by PloverDictionaryParser.
class PloverDictionaryListener(ParseTreeListener):

    # Enter a parse tree produced by PloverDictionaryParser#dictionary.
    def enterDictionary(self, ctx:PloverDictionaryParser.DictionaryContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#dictionary.
    def exitDictionary(self, ctx:PloverDictionaryParser.DictionaryContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#record.
    def enterRecord(self, ctx:PloverDictionaryParser.RecordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#record.
    def exitRecord(self, ctx:PloverDictionaryParser.RecordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#translation.
    def enterTranslation(self, ctx:PloverDictionaryParser.TranslationContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#translation.
    def exitTranslation(self, ctx:PloverDictionaryParser.TranslationContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#command.
    def enterCommand(self, ctx:PloverDictionaryParser.CommandContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#command.
    def exitCommand(self, ctx:PloverDictionaryParser.CommandContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#combo.
    def enterCombo(self, ctx:PloverDictionaryParser.ComboContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#combo.
    def exitCombo(self, ctx:PloverDictionaryParser.ComboContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#key.
    def enterKey(self, ctx:PloverDictionaryParser.KeyContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#key.
    def exitKey(self, ctx:PloverDictionaryParser.KeyContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#normalKey.
    def enterNormalKey(self, ctx:PloverDictionaryParser.NormalKeyContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#normalKey.
    def exitNormalKey(self, ctx:PloverDictionaryParser.NormalKeyContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#modifierKey.
    def enterModifierKey(self, ctx:PloverDictionaryParser.ModifierKeyContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#modifierKey.
    def exitModifierKey(self, ctx:PloverDictionaryParser.ModifierKeyContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#suffix.
    def enterSuffix(self, ctx:PloverDictionaryParser.SuffixContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#suffix.
    def exitSuffix(self, ctx:PloverDictionaryParser.SuffixContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#prefix.
    def enterPrefix(self, ctx:PloverDictionaryParser.PrefixContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#prefix.
    def exitPrefix(self, ctx:PloverDictionaryParser.PrefixContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#infix.
    def enterInfix(self, ctx:PloverDictionaryParser.InfixContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#infix.
    def exitInfix(self, ctx:PloverDictionaryParser.InfixContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#glue.
    def enterGlue(self, ctx:PloverDictionaryParser.GlueContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#glue.
    def exitGlue(self, ctx:PloverDictionaryParser.GlueContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#retroInsertSpace.
    def enterRetroInsertSpace(self, ctx:PloverDictionaryParser.RetroInsertSpaceContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#retroInsertSpace.
    def exitRetroInsertSpace(self, ctx:PloverDictionaryParser.RetroInsertSpaceContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#retroDeleteSpace.
    def enterRetroDeleteSpace(self, ctx:PloverDictionaryParser.RetroDeleteSpaceContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#retroDeleteSpace.
    def exitRetroDeleteSpace(self, ctx:PloverDictionaryParser.RetroDeleteSpaceContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#setSpace.
    def enterSetSpace(self, ctx:PloverDictionaryParser.SetSpaceContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#setSpace.
    def exitSetSpace(self, ctx:PloverDictionaryParser.SetSpaceContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#resetSpace.
    def enterResetSpace(self, ctx:PloverDictionaryParser.ResetSpaceContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#resetSpace.
    def exitResetSpace(self, ctx:PloverDictionaryParser.ResetSpaceContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#capFirstWord.
    def enterCapFirstWord(self, ctx:PloverDictionaryParser.CapFirstWordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#capFirstWord.
    def exitCapFirstWord(self, ctx:PloverDictionaryParser.CapFirstWordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#retroCapFirstWord.
    def enterRetroCapFirstWord(self, ctx:PloverDictionaryParser.RetroCapFirstWordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#retroCapFirstWord.
    def exitRetroCapFirstWord(self, ctx:PloverDictionaryParser.RetroCapFirstWordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#lowerFirstChar.
    def enterLowerFirstChar(self, ctx:PloverDictionaryParser.LowerFirstCharContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#lowerFirstChar.
    def exitLowerFirstChar(self, ctx:PloverDictionaryParser.LowerFirstCharContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#retroLowerFirstChar.
    def enterRetroLowerFirstChar(self, ctx:PloverDictionaryParser.RetroLowerFirstCharContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#retroLowerFirstChar.
    def exitRetroLowerFirstChar(self, ctx:PloverDictionaryParser.RetroLowerFirstCharContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#upperFirstWord.
    def enterUpperFirstWord(self, ctx:PloverDictionaryParser.UpperFirstWordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#upperFirstWord.
    def exitUpperFirstWord(self, ctx:PloverDictionaryParser.UpperFirstWordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#retroUpperFirstWord.
    def enterRetroUpperFirstWord(self, ctx:PloverDictionaryParser.RetroUpperFirstWordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#retroUpperFirstWord.
    def exitRetroUpperFirstWord(self, ctx:PloverDictionaryParser.RetroUpperFirstWordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#carryingCapitalization.
    def enterCarryingCapitalization(self, ctx:PloverDictionaryParser.CarryingCapitalizationContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#carryingCapitalization.
    def exitCarryingCapitalization(self, ctx:PloverDictionaryParser.CarryingCapitalizationContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#casingModes.
    def enterCasingModes(self, ctx:PloverDictionaryParser.CasingModesContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#casingModes.
    def exitCasingModes(self, ctx:PloverDictionaryParser.CasingModesContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#punctuation.
    def enterPunctuation(self, ctx:PloverDictionaryParser.PunctuationContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#punctuation.
    def exitPunctuation(self, ctx:PloverDictionaryParser.PunctuationContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#undo.
    def enterUndo(self, ctx:PloverDictionaryParser.UndoContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#undo.
    def exitUndo(self, ctx:PloverDictionaryParser.UndoContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#repeatLastStroke.
    def enterRepeatLastStroke(self, ctx:PloverDictionaryParser.RepeatLastStrokeContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#repeatLastStroke.
    def exitRepeatLastStroke(self, ctx:PloverDictionaryParser.RepeatLastStrokeContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#retroToggleAsterisk.
    def enterRetroToggleAsterisk(self, ctx:PloverDictionaryParser.RetroToggleAsteriskContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#retroToggleAsterisk.
    def exitRetroToggleAsterisk(self, ctx:PloverDictionaryParser.RetroToggleAsteriskContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#cancelFormatting.
    def enterCancelFormatting(self, ctx:PloverDictionaryParser.CancelFormattingContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#cancelFormatting.
    def exitCancelFormatting(self, ctx:PloverDictionaryParser.CancelFormattingContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#nothing.
    def enterNothing(self, ctx:PloverDictionaryParser.NothingContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#nothing.
    def exitNothing(self, ctx:PloverDictionaryParser.NothingContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#endWord.
    def enterEndWord(self, ctx:PloverDictionaryParser.EndWordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#endWord.
    def exitEndWord(self, ctx:PloverDictionaryParser.EndWordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#currency.
    def enterCurrency(self, ctx:PloverDictionaryParser.CurrencyContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#currency.
    def exitCurrency(self, ctx:PloverDictionaryParser.CurrencyContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#lookahead.
    def enterLookahead(self, ctx:PloverDictionaryParser.LookaheadContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#lookahead.
    def exitLookahead(self, ctx:PloverDictionaryParser.LookaheadContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#ploverCommand.
    def enterPloverCommand(self, ctx:PloverDictionaryParser.PloverCommandContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#ploverCommand.
    def exitPloverCommand(self, ctx:PloverDictionaryParser.PloverCommandContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#meta.
    def enterMeta(self, ctx:PloverDictionaryParser.MetaContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#meta.
    def exitMeta(self, ctx:PloverDictionaryParser.MetaContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#macro.
    def enterMacro(self, ctx:PloverDictionaryParser.MacroContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#macro.
    def exitMacro(self, ctx:PloverDictionaryParser.MacroContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#pgh.
    def enterPgh(self, ctx:PloverDictionaryParser.PghContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#pgh.
    def exitPgh(self, ctx:PloverDictionaryParser.PghContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#en.
    def enterEn(self, ctx:PloverDictionaryParser.EnContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#en.
    def exitEn(self, ctx:PloverDictionaryParser.EnContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#lpluscommand.
    def enterLpluscommand(self, ctx:PloverDictionaryParser.LpluscommandContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#lpluscommand.
    def exitLpluscommand(self, ctx:PloverDictionaryParser.LpluscommandContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#lminuscommand.
    def enterLminuscommand(self, ctx:PloverDictionaryParser.LminuscommandContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#lminuscommand.
    def exitLminuscommand(self, ctx:PloverDictionaryParser.LminuscommandContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#outline.
    def enterOutline(self, ctx:PloverDictionaryParser.OutlineContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#outline.
    def exitOutline(self, ctx:PloverDictionaryParser.OutlineContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#chord.
    def enterChord(self, ctx:PloverDictionaryParser.ChordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#chord.
    def exitChord(self, ctx:PloverDictionaryParser.ChordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#unnumberedChord.
    def enterUnnumberedChord(self, ctx:PloverDictionaryParser.UnnumberedChordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#unnumberedChord.
    def exitUnnumberedChord(self, ctx:PloverDictionaryParser.UnnumberedChordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#numberedChord.
    def enterNumberedChord(self, ctx:PloverDictionaryParser.NumberedChordContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#numberedChord.
    def exitNumberedChord(self, ctx:PloverDictionaryParser.NumberedChordContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#string.
    def enterString(self, ctx:PloverDictionaryParser.StringContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#string.
    def exitString(self, ctx:PloverDictionaryParser.StringContext):
        pass


    # Enter a parse tree produced by PloverDictionaryParser#anychar.
    def enterAnychar(self, ctx:PloverDictionaryParser.AnycharContext):
        pass

    # Exit a parse tree produced by PloverDictionaryParser#anychar.
    def exitAnychar(self, ctx:PloverDictionaryParser.AnycharContext):
        pass



del PloverDictionaryParser