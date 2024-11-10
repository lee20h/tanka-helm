{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='namedResourcesAttribute', url='', help='"NamedResourcesAttribute is a combination of an attribute name and its value."'),
  '#intSlice':: d.obj(help='"NamedResourcesIntSlice contains a slice of 64-bit integers."'),
  intSlice: {
    '#withInts':: d.fn(help='"Ints is the slice of 64-bit integers."', args=[d.arg(name='ints', type=d.T.array)]),
    withInts(ints): { intSlice+: { ints: if std.isArray(v=ints) then ints else [ints] } },
    '#withIntsMixin':: d.fn(help='"Ints is the slice of 64-bit integers."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='ints', type=d.T.array)]),
    withIntsMixin(ints): { intSlice+: { ints+: if std.isArray(v=ints) then ints else [ints] } },
  },
  '#stringSlice':: d.obj(help='"NamedResourcesStringSlice contains a slice of strings."'),
  stringSlice: {
    '#withStrings':: d.fn(help='"Strings is the slice of strings."', args=[d.arg(name='strings', type=d.T.array)]),
    withStrings(strings): { stringSlice+: { strings: if std.isArray(v=strings) then strings else [strings] } },
    '#withStringsMixin':: d.fn(help='"Strings is the slice of strings."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='strings', type=d.T.array)]),
    withStringsMixin(strings): { stringSlice+: { strings+: if std.isArray(v=strings) then strings else [strings] } },
  },
  '#withBool':: d.fn(help='"BoolValue is a true/false value."', args=[d.arg(name='bool', type=d.T.boolean)]),
  withBool(bool): { bool: bool },
  '#withInt':: d.fn(help='"IntValue is a 64-bit integer."', args=[d.arg(name='int', type=d.T.integer)]),
  withInt(int): { int: int },
  '#withName':: d.fn(help='"Name is unique identifier among all resource instances managed by the driver on the node. It must be a DNS subdomain."', args=[d.arg(name='name', type=d.T.string)]),
  withName(name): { name: name },
  '#withQuantity':: d.fn(help="\"Quantity is a fixed-point representation of a number. It provides convenient marshaling/unmarshaling in JSON and YAML, in addition to String() and AsInt64() accessors.\\n\\nThe serialization format is:\\n\\n``` \u003cquantity\u003e        ::= \u003csignedNumber\u003e\u003csuffix\u003e\\n\\n\\t(Note that \u003csuffix\u003e may be empty, from the \\\"\\\" case in \u003cdecimalSI\u003e.)\\n\\n\u003cdigit\u003e           ::= 0 | 1 | ... | 9 \u003cdigits\u003e          ::= \u003cdigit\u003e | \u003cdigit\u003e\u003cdigits\u003e \u003cnumber\u003e          ::= \u003cdigits\u003e | \u003cdigits\u003e.\u003cdigits\u003e | \u003cdigits\u003e. | .\u003cdigits\u003e \u003csign\u003e            ::= \\\"+\\\" | \\\"-\\\" \u003csignedNumber\u003e    ::= \u003cnumber\u003e | \u003csign\u003e\u003cnumber\u003e \u003csuffix\u003e          ::= \u003cbinarySI\u003e | \u003cdecimalExponent\u003e | \u003cdecimalSI\u003e \u003cbinarySI\u003e        ::= Ki | Mi | Gi | Ti | Pi | Ei\\n\\n\\t(International System of units; See: http://physics.nist.gov/cuu/Units/binary.html)\\n\\n\u003cdecimalSI\u003e       ::= m | \\\"\\\" | k | M | G | T | P | E\\n\\n\\t(Note that 1024 = 1Ki but 1000 = 1k; I didn't choose the capitalization.)\\n\\n\u003cdecimalExponent\u003e ::= \\\"e\\\" \u003csignedNumber\u003e | \\\"E\\\" \u003csignedNumber\u003e ```\\n\\nNo matter which of the three exponent forms is used, no quantity may represent a number greater than 2^63-1 in magnitude, nor may it have more than 3 decimal places. Numbers larger or more precise will be capped or rounded up. (E.g.: 0.1m will rounded up to 1m.) This may be extended in the future if we require larger or smaller quantities.\\n\\nWhen a Quantity is parsed from a string, it will remember the type of suffix it had, and will use the same type again when it is serialized.\\n\\nBefore serializing, Quantity will be put in \\\"canonical form\\\". This means that Exponent/suffix will be adjusted up or down (with a corresponding increase or decrease in Mantissa) such that:\\n\\n- No precision is lost - No fractional digits will be emitted - The exponent (or suffix) is as large as possible.\\n\\nThe sign will be omitted unless the number is negative.\\n\\nExamples:\\n\\n- 1.5 will be serialized as \\\"1500m\\\" - 1.5Gi will be serialized as \\\"1536Mi\\\"\\n\\nNote that the quantity will NEVER be internally represented by a floating point number. That is the whole point of this exercise.\\n\\nNon-canonical values will still parse as long as they are well formed, but will be re-emitted in their canonical form. (So always use canonical form, or don't diff.)\\n\\nThis format is intended to make it difficult to use these numbers without writing some sort of special handling code in the hopes that that will cause implementors to also use a fixed point implementation.\"", args=[d.arg(name='quantity', type=d.T.string)]),
  withQuantity(quantity): { quantity: quantity },
  '#withString':: d.fn(help='"StringValue is a string."', args=[d.arg(name='string', type=d.T.string)]),
  withString(string): { string: string },
  '#withVersion':: d.fn(help='"VersionValue is a semantic version according to semver.org spec 2.0.0."', args=[d.arg(name='version', type=d.T.string)]),
  withVersion(version): { version: version },
  '#mixin': 'ignore',
  mixin: self,
}
